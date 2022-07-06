package br.com.cwi.pokemons.presentation.features.pokemons

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.GridLayoutManager
import br.com.cwi.pokemons.databinding.FragmentPokemonBinding
import br.com.cwi.pokemons.domain.entity.Pokemons
import org.koin.androidx.viewmodel.ext.android.sharedViewModel

class PokemonsFragment: Fragment() {

    private lateinit var binding: FragmentPokemonBinding

    private val viewModel : PokemonsViewModel by sharedViewModel()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentPokemonBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setUpViewModel()
    }

    private fun setUpViewModel() {
        viewModel.pokemons.observe(viewLifecycleOwner) { list ->
            setUpPokemonsRecyclerView(list)
        }
    }

    private fun setUpPokemonsRecyclerView(list: List<Pokemons>) {
        binding.rvPokemons.apply {
            layoutManager = GridLayoutManager(context, 3)
            addItemDecoration(
                DividerItemDecoration(context, DividerItemDecoration.VERTICAL)
            )
            adapter = PokemonAdapter(list)
        }
    }
}