package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class PokemonBasePageableResponse (
    @Json(name = "results") val pokemons: List<PokemonBaseResponse>)