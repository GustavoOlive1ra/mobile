package br.com.cwi.pokemons.data.network

import br.com.cwi.pokemons.data.network.entity.PokemonBasePageableResponse
import br.com.cwi.pokemons.data.network.entity.PokemonBaseResponse
import br.com.cwi.pokemons.data.network.entity.PokemonResponse
import retrofit2.http.GET
import retrofit2.http.Path

interface PokemonsApi {

    @GET("pokemon?limit=150&offset=0")
    suspend fun getPokemonsBase(): PokemonBasePageableResponse

    @GET("pokemon/{name}")
    suspend fun getPokemon(@Path("name") name: String): PokemonResponse
}