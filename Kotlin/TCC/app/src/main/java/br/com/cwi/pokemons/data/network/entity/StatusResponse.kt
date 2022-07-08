package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class StatusResponse (
    @Json(name = "base_stat") val value: Int,
    @Json(name = "stat") val stat: StatusBaseResponse
)