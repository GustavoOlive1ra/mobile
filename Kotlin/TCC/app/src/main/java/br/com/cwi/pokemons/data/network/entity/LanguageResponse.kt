package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class LanguageResponse(@Json(name = "name") val name: String)