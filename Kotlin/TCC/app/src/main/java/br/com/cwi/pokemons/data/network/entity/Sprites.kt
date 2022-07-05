package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class Sprites (
    @Json(name = "front_default") val image: String
)