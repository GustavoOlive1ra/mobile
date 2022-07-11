package br.com.cwi.pokemons.domain.entity

class Profile(
    val id: Int?,
    val name: String,
    var qtdFavorite: Int,
    var qtdUnlocked: Int
)