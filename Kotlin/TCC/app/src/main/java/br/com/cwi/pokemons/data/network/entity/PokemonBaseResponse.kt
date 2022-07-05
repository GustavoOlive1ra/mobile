package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class PokemonBaseResponse (
        @Json(name = "name") val name: String,
        @Json(name = "url") val url: String
)