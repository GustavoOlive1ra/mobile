package br.com.cwi.pokemons.presentation.features.pokemons.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.GridLayoutManager
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.FragmentPokemonBinding
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.presentation.features.pokemons.PokemonsViewModel
import br.com.cwi.pokemons.presentation.features.pokemons.adapter.PokemonAdapter
import org.koin.androidx.viewmodel.ext.android.sharedViewModel

const val KEY_NAME_POKEMON = "pokemon_name"

class PokemonsFragment : Fragment() {

    private lateinit var binding: FragmentPokemonBinding

    private val viewModel: PokemonsViewModel by sharedViewModel()

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

    override fun onResume() {
        super.onResume()
        viewModel.pokemons.value?.let { pokemons ->
            viewModel.refreshPokemonsUnlokedAndFavorite(pokemons)
        }
    }

    private fun setUpViewModel() {
        viewModel.pokemons.observe(viewLifecycleOwner) { list ->
            setUpPokemonsRecyclerView(list)
        }
    }

    private fun setUpPokemonsRecyclerView(list: List<Pokemons>) {
        binding.rvPokemons.apply {
            layoutManager = GridLayoutManager(context, 3)
            adapter = PokemonAdapter(list, { navigationToPokemonDetail(it) })
        }
    }

    private fun navigationToPokemonDetail(name: String) {
        findNavController().navigate(
            R.id.action_pokemonsFragment_to_pokemonsDetailFragment, bundleOf(
                Pair(KEY_NAME_POKEMON, name)
            )
        )
    }
}