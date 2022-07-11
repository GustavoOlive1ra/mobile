package br.com.cwi.pokemons.presentation.features.pokemons

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.domain.repository.FavoritePokemonRepository
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import br.com.cwi.pokemons.domain.repository.UnlockedPokemonRepository
import kotlinx.coroutines.launch

class PokemonsViewModel(
    private val pokemonRepository: PokemonRepository,
    private val unlockedPokemonRepository: UnlockedPokemonRepository,
    private val favoritePokemonRepository: FavoritePokemonRepository
) : ViewModel() {

    private val _pokemons = MutableLiveData<List<Pokemons>>()
    val pokemons: LiveData<List<Pokemons>> = _pokemons

    fun fetchPokemons() {
        viewModelScope.launch {
            val pokemonResponse = pokemonRepository.getPokemons()
            refreshPokemonsUnlokedAndFavorite(pokemonResponse)
        }
    }

    fun refreshPokemonsUnlokedAndFavorite(pokemons: List<Pokemons>){
        val pokemonsUnlocked = setUpUnlockedPokemons(pokemons)
        val pokemonsFavorite = setUpFavoritePokemons(pokemonsUnlocked)
        _pokemons.postValue(pokemonsFavorite)
    }


    private fun setUpUnlockedPokemons(pokemons: List<Pokemons>): List<Pokemons>{
        viewModelScope.launch {
            pokemons.forEach {
                it.unlocked = unlockedPokemonRepository.isUnlockedPokemon(it.name)
            }
        }
        return pokemons
    }


    private fun setUpFavoritePokemons(pokemons: List<Pokemons>): List<Pokemons>{
        viewModelScope.launch {
            pokemons.forEach {
                it.favorite = favoritePokemonRepository.isFavoritePokemon(it.name)
            }
        }
        return pokemons
    }
}