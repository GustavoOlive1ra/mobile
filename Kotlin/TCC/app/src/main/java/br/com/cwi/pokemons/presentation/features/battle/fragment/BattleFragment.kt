package br.com.cwi.pokemons.presentation.features.battle.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.DividerItemDecoration
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.FragmentBattleBinding
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.presentation.extension.visibleOrGone
import br.com.cwi.pokemons.presentation.features.battle.BattleViewModel
import br.com.cwi.pokemons.presentation.features.battle.adapter.BattleAdapter
import com.bumptech.glide.Glide
import org.koin.androidx.viewmodel.ext.android.sharedViewModel

class BattleFragment : Fragment() {

    private lateinit var binding: FragmentBattleBinding

    private val viewModel: BattleViewModel by sharedViewModel()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentBattleBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setUpViewModel()
    }

    override fun onDestroyView() {
        viewModel.resetPokemonBattle()
        super.onDestroyView()
    }

    private fun setUpViewModel() {
        viewModel.pokemonFirstChoice.value?.let { first ->
            setUpBattleViewFirstOpponent(first)
            viewModel.pokemonSecondChoice.value?.let { second ->
                setUpBattleViewSecondOpponent(second)
                setUpBattleLog(first, second)
            }
        }
        setUpToolbar()
    }

    private fun setUpBattleViewFirstOpponent(pokemonDetail: PokemonDetail) {
        binding.apply {
            Glide.with(root.context).load(pokemonDetail.image).into(ivFirstOpponent)
            tvFirstOpponent.text = pokemonDetail.name.uppercase()
        }
    }

    private fun setUpBattleViewSecondOpponent(pokemonDetail: PokemonDetail) {
        binding.apply {
            Glide.with(root.context).load(pokemonDetail.image).into(ivSecondOpponent)
            tvSecondOpponent.text = pokemonDetail.name.uppercase()
        }
    }

    private fun setUpToolbar() {
        val titleToolBar = "BATTLE"
        binding.toolbar.apply {
            (activity as AppCompatActivity?)!!.setSupportActionBar(this)
            title = titleToolBar
            setNavigationIcon(R.drawable.ic_arrow_back);
            setNavigationOnClickListener {
                activity?.onBackPressed();
            }
        }
    }

    private fun setUpBattleLog(pokemonFirst: PokemonDetail, pokemonSecond: PokemonDetail) {
        viewModel.battleLog.observe(viewLifecycleOwner) { list ->
            binding.rvBattleLog.apply {
                addItemDecoration(
                    DividerItemDecoration(context, DividerItemDecoration.VERTICAL)
                )
                adapter = BattleAdapter(list)
            }
        }
        viewModel.battleResult.observe(viewLifecycleOwner) {
            binding.tvResult.text = it
            binding.tvResult.visibleOrGone(true)
        }
        binding.tvResult.visibleOrGone(false)
        viewModel.startBattle(pokemonFirst, pokemonSecond)
    }


}