package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class StatusBaseResponse (
    @Json(name = "name") val name: String
)