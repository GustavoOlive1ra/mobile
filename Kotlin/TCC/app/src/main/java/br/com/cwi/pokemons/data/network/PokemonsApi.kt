package br.com.cwi.pokemons.data.network

import br.com.cwi.pokemons.data.network.entity.PokemonBasePageableResponse
import br.com.cwi.pokemons.data.network.entity.PokemonDetailResponse
import br.com.cwi.pokemons.data.network.entity.PokemonSpeciesResponse
import retrofit2.http.GET
import retrofit2.http.Path

interface PokemonsApi {

    @GET("pokemon?limit=151&offset=0")
    suspend fun getPokemonsBase(): PokemonBasePageableResponse

    @GET("pokemon/{name}")
    suspend fun getPokemonDetail(@Path("name") name: String): PokemonDetailResponse

    @GET("pokemon-species/{name}")
    suspend fun getPokemonSpecies(@Path("name") name: String): PokemonSpeciesResponse
}