package br.com.cwi.pokemons.domain.entity

class PokemonDetail(
    val id: Int,
    val height: Int,
    val name: String,
    val weight: Int,
    val image: String,
    val status: List<Status>,
)