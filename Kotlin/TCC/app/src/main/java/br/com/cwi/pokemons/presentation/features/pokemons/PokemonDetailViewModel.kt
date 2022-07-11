package br.com.cwi.pokemons.presentation.features.pokemons

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.data.database.entity.UnlockedPokemonEntity
import br.com.cwi.pokemons.domain.entity.FavoritePokemon
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.PokemonSpecies
import br.com.cwi.pokemons.domain.entity.UnlockedPokemon
import br.com.cwi.pokemons.domain.repository.FavoritePokemonRepository
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import br.com.cwi.pokemons.domain.repository.UnlockedPokemonRepository
import kotlinx.coroutines.launch

class PokemonDetailViewModel(
    private val pokemonRepository: PokemonRepository,
    private val unlockedPokemonRepository: UnlockedPokemonRepository,
    private val favoritePokemonRepository: FavoritePokemonRepository
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

    fun setUpFavoritePokemon(pokemonDetail: PokemonDetail){
        viewModelScope.launch {
            if(!favoritePokemonRepository.isFavoritePokemon(pokemonDetail.name)){
                val newFavoritePokemonPokemon = FavoritePokemon(pokemonDetail.name)
                favoritePokemonRepository.addFavoritePokemons(newFavoritePokemonPokemon)
            }else{
                favoritePokemonRepository.removeFavoritePokemonsByName(pokemonDetail.name)
            }
        }
    }

    fun fetchPokemonDetail(name: String) {
        viewModelScope.launch {
            val pokemonResponse = pokemonRepository.getPokemonDetail(name)
            pokemonResponse.isFavorite = favoritePokemonRepository.isFavoritePokemon(pokemonResponse.name)
            _pokemonDetail.postValue(pokemonResponse)
        }
    }

    fun fetchPokemonSpecies(name: String) {
        viewModelScope.launch {
            _pokemonSpecies.postValue(pokemonRepository.getPokemonSpecies(name))
        }
    }
}