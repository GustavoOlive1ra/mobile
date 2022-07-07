package br.com.cwi.pokemons.data.repository

import br.com.cwi.pokemons.data.network.PokemonsApi
import br.com.cwi.pokemons.data.network.entity.PokemonSpeciesResponse
import br.com.cwi.pokemons.data.network.mapper.PokemonBaseMapper
import br.com.cwi.pokemons.data.network.mapper.PokemonDetailMapper
import br.com.cwi.pokemons.data.network.mapper.PokemonSpeciesMapper
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.PokemonSpecies
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class PokemonRepositoryImpl(
    private val api: PokemonsApi,
    private val pokemonDetailMapper: PokemonDetailMapper,
    private val pokemonSpeciesMapper: PokemonSpeciesMapper,
    private val pokemonBaseMapper: PokemonBaseMapper
) : PokemonRepository {

    override suspend fun getPokemons(): List<Pokemons> {
        return withContext(Dispatchers.IO) {
            pokemonBaseMapper.toDomain(api.getPokemonsBase().pokemons)
        }
    }

    override suspend fun getPokemonDetail(name: String): PokemonDetail {
        return  withContext(Dispatchers.IO) {
            pokemonDetailMapper.toDomain(api.getPokemonDetail(name))
        }
    }

    override suspend fun getPokemonSpecies(name: String): PokemonSpecies {
        return  withContext(Dispatchers.IO) {
           pokemonSpeciesMapper.toDomain(api.getPokemonSpecies(name))
        }
    }

}