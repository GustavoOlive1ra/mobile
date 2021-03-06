package br.com.cwi.pokemons.presentation.features.pokemons.fragment

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.GridLayoutManager
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.FragmentPokemonDetailBinding
import br.com.cwi.pokemons.domain.entity.Ability
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.PokemonSpecies
import br.com.cwi.pokemons.domain.entity.Status
import br.com.cwi.pokemons.presentation.features.battle.BattleHostActivity
import br.com.cwi.pokemons.presentation.features.pokemons.PokemonDetailViewModel
import br.com.cwi.pokemons.presentation.features.pokemons.adapter.PokemonExpandListAdapter
import br.com.cwi.pokemons.presentation.features.pokemons.adapter.PokemonTypeAdapter
import com.bumptech.glide.Glide
import org.koin.androidx.viewmodel.ext.android.viewModel


const val LANGUAGE_TARGET = "en"
const val PREVIUS_TEXT = "Text entry: "
const val LINE_BREAK = "\n"
const val SPACE = " "
const val KEY_ABILITY = "Ability"
const val KEY_STATUS = "Status"
const val KEY_SIZE = "Size"

const val POKEMON_CHOSE = "chose"

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
        setUpToolbar()
    }

    private fun setUpToolbar() {
        binding.toolbar.apply {
            (activity as AppCompatActivity?)!!.setSupportActionBar(this)
            setTitle(pokemonName.uppercase())
            setTitleTextColor(ContextCompat.getColor(context, R.color.white))
            setNavigationIcon(R.drawable.ic_arrow_back);
            setNavigationOnClickListener {
                activity?.onBackPressed();
            }
        }
    }

    private fun setUpViewModel() {
        viewModel.pokemonDetail.observe(viewLifecycleOwner) { pokemon ->
            setUpPokemonDetailView(pokemon)
        }
        viewModel.pokemonSpecies.observe(viewLifecycleOwner) { pokemonSpecies ->
            setUpPokemonSpeciesView(pokemonSpecies)
            setUpBackgroundPokemon(pokemonSpecies)
        }
        viewModel.fetchPokemonsInfos(pokemonName)
    }

    private fun setUpPokemonDetailView(pokemonDetail: PokemonDetail) {
        binding.tvName.text = pokemonDetail.name.uppercase()
        Glide.with(binding.root).load(pokemonDetail.image).into(binding.ivPokemon)
        binding.ivFavorite.apply {
            setImageDrawable(getFavoriteIcon(pokemonDetail))
            setOnClickListener {
                pokemonDetail.isFavorite = !pokemonDetail.isFavorite
                setImageDrawable(getFavoriteIcon(pokemonDetail))
                viewModel.setUpFavoritePokemon(pokemonDetail)
            }
        }
        binding.rvType.apply {
            layoutManager = GridLayoutManager(context, 1)
            adapter = PokemonTypeAdapter(pokemonDetail.type)
        }
        binding.ivBattle.setOnClickListener {
            val intent = Intent(context, BattleHostActivity::class.java).putExtra(
                POKEMON_CHOSE,
                pokemonDetail
            )
            startActivity(intent)
        }

        setupExpandableListView(pokemonDetail)
    }

    private fun getFavoriteIcon(pokemon: PokemonDetail) = ContextCompat.getDrawable(
        binding.root.context,
        if (pokemon.isFavorite) R.drawable.ic_favorite
        else R.drawable.ic_not_favorite
    )


    private fun setUpPokemonSpeciesView(pokemonSpecies: PokemonSpecies) {
        binding.tvEntryTxt.text = PREVIUS_TEXT + findFirstDescriptionLanguage(pokemonSpecies)
    }

    private fun findFirstDescriptionLanguage(pokemonSpecies: PokemonSpecies): String? {
        return pokemonSpecies.description.find { description -> description.language == LANGUAGE_TARGET }?.text?.replace(
            LINE_BREAK,
            SPACE
        )
    }

    private fun setupExpandableListView(
        pokemonDetail: PokemonDetail
    ) {
        val titleList = listOf(KEY_SIZE, KEY_ABILITY, KEY_STATUS)
        val dataList = hashMapOf(
            Pair(
                KEY_SIZE,
                sizeToStringList(pokemonDetail.height, pokemonDetail.weight)
            ),
            Pair(
                KEY_STATUS,
                statusToStringList(pokemonDetail.status)
            ),
            Pair(
                KEY_ABILITY,
                abilityToStringList(pokemonDetail.ability)
            ),
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

    private fun sizeToStringList(height: Int, weight: Int): List<String> {
        return listOf("Height: $height", "Weight: $weight")
    }

    private fun setUpBackgroundPokemon(pokemonSpecies: PokemonSpecies) {
        var getResorces = when (pokemonSpecies.habitat) {
            "grassland" -> ContextCompat.getDrawable(binding.root.context, R.drawable.grassland_2)
            "forest" -> ContextCompat.getDrawable(binding.root.context, R.drawable.forest)
            "cave" -> ContextCompat.getDrawable(binding.root.context, R.drawable.cave)
            "mountain" -> ContextCompat.getDrawable(binding.root.context, R.drawable.mountain)
            "rough-terrain" -> ContextCompat.getDrawable(
                binding.root.context,
                R.drawable.rough_terrain
            )
            "sea" -> ContextCompat.getDrawable(binding.root.context, R.drawable.sea)
            "urban" -> ContextCompat.getDrawable(binding.root.context, R.drawable.urban)
            "waters-edge" -> ContextCompat.getDrawable(binding.root.context, R.drawable.waters_edge)
            else -> ContextCompat.getDrawable(binding.root.context, R.drawable.grassland)
        }
        binding.clPokemonCard.background = getResorces
    }
}

