package br.com.cwi.pokemons.data.database.mapper

import br.com.cwi.pokemons.data.database.entity.ProfileEntity
import br.com.cwi.pokemons.domain.entity.Profile

fun Profile.toProfileEntity() = ProfileEntity(
    name = name, id = id, qtdFavorite = qtdFavorite, qtdUnlocked = qtdUnlocked
)

fun ProfileEntity.toProfile() = Profile(
    name = name, id = id, qtdFavorite = qtdFavorite, qtdUnlocked = qtdUnlocked
)