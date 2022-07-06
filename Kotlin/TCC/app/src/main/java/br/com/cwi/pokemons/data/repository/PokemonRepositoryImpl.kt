package br.com.cwi.pokemons.data.repository

import br.com.cwi.pokemons.data.network.PokemonsApi
import br.com.cwi.pokemons.data.network.mapper.PokemonBaseMapper
import br.com.cwi.pokemons.data.network.mapper.PokemonDatailMapper
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class PokemonRepositoryImpl(
    private val api: PokemonsApi,
    private val pokemonDatailMapper: PokemonDatailMapper,
    private val pokemonBaseMapper: PokemonBaseMapper
) : PokemonRepository {

    override suspend fun getPokemons(): List<Pokemons> {
        return withContext(Dispatchers.IO) {
            pokemonBaseMapper.toDomain(api.getPokemonsBase().pokemons)
        }
    }

    override suspend fun getPokemonDetail(name: String): PokemonDetail {
        return  withContext(Dispatchers.IO) {
            pokemonDatailMapper.toDomain(api.getPokemon(name))
        }
    }

}