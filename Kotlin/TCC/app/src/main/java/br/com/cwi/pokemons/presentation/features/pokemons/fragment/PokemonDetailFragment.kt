package br.com.cwi.pokemons.presentation.features.pokemons.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import br.com.cwi.pokemons.databinding.FragmentPokemonDetailBinding
import br.com.cwi.pokemons.domain.entity.Ability
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.PokemonSpecies
import br.com.cwi.pokemons.domain.entity.Status
import br.com.cwi.pokemons.presentation.features.pokemons.PokemonDetailViewModel
import br.com.cwi.pokemons.presentation.features.pokemons.adapter.PokemonExpandListAdapter
import com.bumptech.glide.Glide
import org.koin.androidx.viewmodel.ext.android.viewModel

const val LANGUAGE_TARGET = "en"
const val PREVIUS_TEXT = "Text entry: "
const val LINE_BREAK = "\n"
const val SPACE = " "
const val KEY_ABILITY = "Ability"
const val KEY_STATUS = "Status"

class PokemonDetailFragment : Fragment() {

    private lateinit var binding: FragmentPokemonDetailBinding

    private val viewModel: PokemonDetailViewModel by viewModel()

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

    private fun setUpPokemonDetailView(pokemonDetail: PokemonDetail) {
        binding.tvName.text = pokemonDetail.name.uppercase()
        Glide.with(binding.root).load(pokemonDetail.image).into(binding.ivPokemon)
        setupExpandableListView(pokemonDetail)
    }

    private fun setUpPokemonSpeciesView(pokemonSpecies: PokemonSpecies) {
        binding.tvEntryTxt.text = PREVIUS_TEXT + findFirstDescriptionLanguage(pokemonSpecies)
    }

    private fun findFirstDescriptionLanguage(pokemonSpecies: PokemonSpecies): String? {
        return pokemonSpecies.description.find { description -> description.language == LANGUAGE_TARGET }?.text?.replace(
            LINE_BREAK,
            SPACE
        )
    }

    private fun setupExpandableListView(pokemonDetail: PokemonDetail
    ) {
        val titleList = listOf(KEY_ABILITY, KEY_STATUS)
        val dataList = hashMapOf(
            Pair(
                KEY_STATUS,
                statusToStringList(pokemonDetail.status)
            ),
            Pair(
                KEY_ABILITY,
                abilityToStringList(pokemonDetail.ability)
            )
        )
        binding.evInfos.apply {
            setAdapter(PokemonExpandListAdapter(context, titleList, dataList))
        }
    }

    private fun abilityToStringList(ability: List<Ability>): List<String> {
        return ability.map { ability -> "${ability.name}" }
    }

    private fun statusToStringList(status: List<Status>): List<String> {
        return status.map { status -> "${status.name}: ${status.value}" }
    }
}

