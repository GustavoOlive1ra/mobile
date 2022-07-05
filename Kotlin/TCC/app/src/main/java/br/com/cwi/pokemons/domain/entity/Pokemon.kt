package br.com.cwi.pokemons.domain.entity

import com.squareup.moshi.Json

class Pokemon(
    val id: Int,
    val height: Int,
    val name: String,
    val weight: Int,
    val image: String,
)