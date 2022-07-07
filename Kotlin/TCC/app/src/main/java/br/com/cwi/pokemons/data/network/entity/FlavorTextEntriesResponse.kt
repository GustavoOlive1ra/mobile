package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class FlavorTextEntriesResponse(
    @Json(name = "flavor_text") val text: String,
    @Json(name="language") val language: LanguageResponse
    )