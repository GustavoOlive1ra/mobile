package br.com.cwi.pokemons.presentation.features.pokemons

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.data.database.entity.UnlockedPokemonEntity
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.PokemonSpecies
import br.com.cwi.pokemons.domain.entity.UnlockedPokemon
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import br.com.cwi.pokemons.domain.repository.UnlockedPokemonRepository
import kotlinx.coroutines.launch

class PokemonDetailViewModel(
    private val pokemonRepository: PokemonRepository,
    private val unlockedPokemonRepository: UnlockedPokemonRepository
) : ViewModel() {

    private val _pokemonDetail = MutableLiveData<PokemonDetail>()
    val pokemonDetail: LiveData<PokemonDetail> = _pokemonDetail

    private val _pokemonSpecies = MutableLiveData<PokemonSpecies>()
    val pokemonSpecies: LiveData<PokemonSpecies> = _pokemonSpecies

    fun fetchPokemonsInfos(name: String) {
        fetchPokemonDetail(name)
        fetchPokemonSpecies(name)
        setUpUnlockedPokemon(name)
    }

    private fun setUpUnlockedPokemon(name: String){
        viewModelScope.launch {
            if(!unlockedPokemonRepository.isUnlockedPokemon(name)){
                val newUnlockedPokemon = UnlockedPokemon(name)
                unlockedPokemonRepository.addUnlockedPokemons(newUnlockedPokemon)
            }
        }
    }

    fun fetchPokemonDetail(name: String) {
        viewModelScope.launch {
            _pokemonDetail.postValue(pokemonRepository.getPokemonDetail(name))
        }
    }

    fun fetchPokemonSpecies(name: String) {
        viewModelScope.launch {
            _pokemonSpecies.postValue(pokemonRepository.getPokemonSpecies(name))
        }
    }
}