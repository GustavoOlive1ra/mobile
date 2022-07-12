package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class TypesResponse (
    @Json(name = "type") val type: TypeBaseResponse,
)