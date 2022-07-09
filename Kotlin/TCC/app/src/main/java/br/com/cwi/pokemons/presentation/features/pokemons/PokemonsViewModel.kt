package br.com.cwi.pokemons.presentation.features.pokemons

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import br.com.cwi.pokemons.domain.repository.UnlockedPokemonRepository
import kotlinx.coroutines.launch

class PokemonsViewModel(
    private val pokemonRepository: PokemonRepository,
    private val unlockedPokemonRepository: UnlockedPokemonRepository
) : ViewModel() {

    private val _pokemons = MutableLiveData<List<Pokemons>>()
    val pokemons: LiveData<List<Pokemons>> = _pokemons

    fun fetchPokemons() {
        viewModelScope.launch {
            val pokemonResponse = pokemonRepository.getPokemons()
            attUnlockedPokemons(pokemonResponse)
        }
    }

    fun attUnlockedPokemons(pokemons: List<Pokemons>){
        viewModelScope.launch {
            pokemons.forEach {
                it.unlocked = unlockedPokemonRepository.isUnlockedPokemon(it.name)
            }
            _pokemons.postValue(pokemons)
        }
    }
}