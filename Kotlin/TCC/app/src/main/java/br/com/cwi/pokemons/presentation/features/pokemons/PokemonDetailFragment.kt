package br.com.cwi.pokemons.presentation.features.pokemons

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import br.com.cwi.pokemons.databinding.FragmentPokemonDetailBinding
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.PokemonSpecies
import com.bumptech.glide.Glide
import org.koin.androidx.viewmodel.ext.android.viewModel

const val LANGUAGE_TARGET = "en"
const val PREVIUS_TEXT = "Description: "
const val LINE_BREAK= "\n"
const val SPACE= " "

class PokemonDetailFragment: Fragment() {

    private lateinit var binding: FragmentPokemonDetailBinding

    private val viewModel : PokemonDetailViewModel by viewModel()

    private val pokemonName by lazy {
        arguments?.get(KEY_NAME_POKEMON) as String
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
        setUpViewModel()

    }

    private fun setUpViewModel() {
        viewModel.pokemonDetail.observe(viewLifecycleOwner) { pokemon ->
            setUpPokemonDetailView(pokemon)
        }

        viewModel.pokemonSpecies.observe(viewLifecycleOwner) { pokemonSpecies ->
            setUpPokemonSpeciesView(pokemonSpecies)
        }
        viewModel.fetchPokemonsInfos(pokemonName)
    }

    private fun setUpPokemonDetailView(pokemonDetail: PokemonDetail){
        binding.tvName.text = pokemonDetail.name
        Glide.with(binding.root).load(pokemonDetail.image).into(binding.ivPokemon)
    }

    private fun setUpPokemonSpeciesView(pokemonSpecies: PokemonSpecies){
        binding.tvDescription.text = PREVIUS_TEXT + findFirstDescriptionLanguage(pokemonSpecies)
    }

    private fun findFirstDescriptionLanguage(pokemonSpecies: PokemonSpecies): String?{
        return pokemonSpecies.description.find { description -> description.language == LANGUAGE_TARGET}?.text?.replace(LINE_BREAK, SPACE)
    }

}