package br.com.cwi.pokemons.domain.entity

class Pokemons (
    val name: String,
    val url: String,
    val image: String,
    var unlocked: Boolean = false,
    var favorite: Boolean = false,
)