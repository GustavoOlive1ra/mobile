package br.com.cwi.pokemons.presentation.features.pokemons

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import br.com.cwi.pokemons.databinding.FragmentPokemonDetailBinding
import org.koin.androidx.viewmodel.ext.android.sharedViewModel

class PokemonDetailFragment: Fragment() {

    private lateinit var binding: FragmentPokemonDetailBinding

    private val viewModel : PokemonsViewModel by sharedViewModel()

    private val pokemonName by lazy {
        arguments?.get(KEY_NAME_POKEMON) as? String
    }


    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentPokemonDetailBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.teste.text = pokemonName
    }

}