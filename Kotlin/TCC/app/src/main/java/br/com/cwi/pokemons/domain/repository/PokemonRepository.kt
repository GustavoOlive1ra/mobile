package br.com.cwi.pokemons.domain.repository

import br.com.cwi.pokemons.data.network.entity.PokemonBasePageableResponse
import br.com.cwi.pokemons.domain.entity.Pokemon

interface PokemonRepository {
    suspend fun getPokemons(): List<Pokemon>
}