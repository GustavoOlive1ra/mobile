package br.com.cwi.pokemons.presentation.features.battle

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import br.com.cwi.pokemons.domain.repository.UnlockedPokemonRepository
import kotlinx.coroutines.launch
import org.koin.ext.getScopeName

class BattleViewModel(
    private val pokemonRepository: PokemonRepository,
    private val unlockedPokemonRepository: UnlockedPokemonRepository
) : ViewModel() {

    private val _pokemons = MutableLiveData<List<Pokemons>>()
    val pokemons: LiveData<List<Pokemons>> = _pokemons

    private val _pokemonFirstChoice = MutableLiveData<PokemonDetail>()
    val pokemonFirstChoice: LiveData<PokemonDetail> = _pokemonFirstChoice

    private val _pokemonSecondChoice = MutableLiveData<PokemonDetail>()
    val pokemonSecondChoice: LiveData<PokemonDetail> = _pokemonSecondChoice

    fun fetchPokemons() {
        viewModelScope.launch {
            val pokemonResponse = pokemonRepository.getPokemons()
            val pokemons = setUpUnlockedPokemons(pokemonResponse)
            _pokemons.postValue(filterUnlockedPokemons(pokemons))
        }
    }

    fun setPokemonFirstChoice(pokemonDetail: PokemonDetail){
        _pokemonFirstChoice.postValue(pokemonDetail)
    }


    private fun setUpUnlockedPokemons(pokemons: List<Pokemons>): List<Pokemons> {
        viewModelScope.launch {
            pokemons.forEach {
                it.unlocked = unlockedPokemonRepository.isUnlockedPokemon(it.name)
            }
        }
        return pokemons
    }

    private fun filterUnlockedPokemons(pokemons: List<Pokemons>): List<Pokemons>{
        return pokemons.filter { pokemon->pokemon.unlocked && pokemon.name != pokemonFirstChoice.value?.name}
    }

    fun setPokemonSecondChoice(name: String){
        viewModelScope.launch {
            val pokemonResponse = pokemonRepository.getPokemonDetail(name)
            _pokemonSecondChoice.postValue(pokemonResponse)
        }
    }
    fun resetPokemonSecondChoice(){
        _pokemonSecondChoice.postValue(null)
    }
}