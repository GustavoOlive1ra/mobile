package br.com.cwi.pokemons.presentation.features.pokemons

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import kotlinx.coroutines.launch

class PokemonsViewModel(private val pokemonRepository: PokemonRepository): ViewModel() {

    private val _pokemons = MutableLiveData<List<Pokemons>>()
    val pokemons: LiveData<List<Pokemons>> = _pokemons

    fun fetchPokemons() {
        viewModelScope.launch {
            _pokemons.postValue(pokemonRepository.getPokemons())
        }
    }
}