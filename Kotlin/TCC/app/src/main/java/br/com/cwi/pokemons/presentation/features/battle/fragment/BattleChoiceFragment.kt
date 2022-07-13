package br.com.cwi.pokemons.presentation.features.battle.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.GridLayoutManager
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.FragmentBattleChoiceOpponentBinding
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.presentation.features.battle.BattleViewModel
import br.com.cwi.pokemons.presentation.features.pokemons.adapter.PokemonAdapter
import br.com.cwi.pokemons.presentation.features.pokemons.fragment.KEY_NAME_POKEMON
import org.koin.androidx.viewmodel.ext.android.sharedViewModel

class BattleChoiceFragment : Fragment() {

    private lateinit var binding: FragmentBattleChoiceOpponentBinding

    private val viewModel: BattleViewModel by sharedViewModel()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentBattleChoiceOpponentBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setUpViewModel()
    }

    private fun setUpViewModel() {
        viewModel.pokemons.observe(viewLifecycleOwner) {
            setUpBattleView(it)
        }
    }

    private fun setUpBattleView(pokemons: List<Pokemons>) {
        setUpToolbar()
        binding.rvPokemonsOpponent.apply {
            layoutManager = GridLayoutManager(context, 3)
            adapter = PokemonAdapter(pokemons) { selectedPokemonOpponent(it) }
        }

        val FIRST_CHOICE = "First choice"
        binding.tvFirstChoice.text =
            "${FIRST_CHOICE}: ${viewModel.pokemonFirstChoice.value?.name?.uppercase()}"
    }


    private fun setUpToolbar() {
        val titleToolBar = "SELECT OPPONENT"
        binding.toolbar.apply {
            (activity as AppCompatActivity?)!!.setSupportActionBar(this)
            title = titleToolBar
            setNavigationIcon(R.drawable.ic_arrow_back);
            setNavigationOnClickListener {
                activity?.onBackPressed();
            }
        }
    }

    private fun selectedPokemonOpponent(name: String) {
        viewModel.pokemonSecondChoice.observe(viewLifecycleOwner) {
            it?.let { navigateToBattle() }
        }
        viewModel.setPokemonSecondChoice(name)
    }

    private fun navigateToBattle(){
        findNavController().navigate(
            R.id.action_battleChoiceFragment_to_battleFragment
        )
    }
}