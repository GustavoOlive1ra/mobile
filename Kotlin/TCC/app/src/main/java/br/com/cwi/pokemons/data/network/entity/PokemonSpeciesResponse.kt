package br.com.cwi.pokemons.data.network.entity

import com.squareup.moshi.Json

class PokemonSpeciesResponse(
    @Json(name = "flavor_text_entries") val description: List<FlavorTextEntriesResponse>
    )