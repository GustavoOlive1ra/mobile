package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class AbilitiesResponse(@Json(name = "ability") val ability: AbilityResponse)