package br.com.cwi.pokemons.domain.entity

import android.net.Uri

class Profile(
    var id: Int?,
    var name: String,
    var qtdFavorite: Int,
    var qtdUnlocked: Int,
    var image: String?
)