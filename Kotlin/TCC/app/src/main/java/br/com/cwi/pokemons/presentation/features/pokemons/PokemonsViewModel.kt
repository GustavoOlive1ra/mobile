package br.com.cwi.pokemons.presentation.features.pokemons

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import kotlinx.coroutines.launch

class PokemonsViewModel(private val pokemonRepository: PokemonRepository): ViewModel() {

    fun fetchPokemons() {
        viewModelScope.launch {
            val categoryList = pokemonRepository.getPokemons()
            categoryList.size
        }
    }
}