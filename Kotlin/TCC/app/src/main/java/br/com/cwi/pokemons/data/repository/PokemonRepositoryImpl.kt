package br.com.cwi.pokemons.data.repository

import br.com.cwi.pokemons.data.network.PokemonsApi
import br.com.cwi.pokemons.data.network.entity.PokemonBasePageableResponse
import br.com.cwi.pokemons.data.network.entity.PokemonBaseResponse
import br.com.cwi.pokemons.data.network.entity.PokemonResponse
import br.com.cwi.pokemons.data.network.mapper.PokemonMapper
import br.com.cwi.pokemons.domain.entity.Pokemon
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class PokemonRepositoryImpl(
    private val api: PokemonsApi,
    private val pokemonMapper: PokemonMapper
) : PokemonRepository {

    suspend fun getPokemonsBase(): PokemonBasePageableResponse {
        return withContext(Dispatchers.IO) {
            api.getPokemonsBase()
        }
    }

    override suspend fun getPokemons(): List<Pokemon> {
        val pokemonsBaseResponse = getPokemonsBase().pokemons
        val pokemons = pokemonMapper.toDomain(findPokemonsByName(pokemonsBaseResponse))
        return pokemons;
    }

    private suspend fun findPokemonsByName(pokemonsBase: List<PokemonBaseResponse>): List<PokemonResponse>{
        val pokemonsResponse = mutableListOf<PokemonResponse>()
        pokemonsBase.forEach { pokemonBase->
            pokemonsResponse.add(
                withContext(Dispatchers.IO) {
                    api.getPokemon(pokemonBase.name)
                }
            )
        }
        return pokemonsResponse
    }
}