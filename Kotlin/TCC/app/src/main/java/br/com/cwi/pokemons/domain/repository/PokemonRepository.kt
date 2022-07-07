package br.com.cwi.pokemons.domain.repository

import br.com.cwi.pokemons.data.network.entity.PokemonSpeciesResponse
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.PokemonSpecies
import br.com.cwi.pokemons.domain.entity.Pokemons

interface PokemonRepository {
    suspend fun getPokemons(): List<Pokemons>
    suspend fun getPokemonDetail(name: String): PokemonDetail
    suspend fun getPokemonSpecies(name: String): PokemonSpecies
}
