package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class PokemonDetailResponse (
    @Json(name = "id") val id: Int,
    @Json(name = "height") val height: Int,
    @Json(name = "name") val name: String,
    @Json(name = "weight") val weight: Int,
    @Json(name = "sprites") val spritesResponse: SpritesResponse,
    @Json(name = "stats") val status: List<StatusResponse>,
    @Json(name = "abilities") val abilities: List<AbilitiesResponse>,
    @Json(name = "types") val types: List<TypesResponse>
)