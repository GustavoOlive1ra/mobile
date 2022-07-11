package br.com.cwi.pokemons.data.database.mapper

import br.com.cwi.pokemons.data.database.entity.FavoritePokemonEntity
import br.com.cwi.pokemons.domain.entity.FavoritePokemon

fun FavoritePokemon.toFavoriteEntity() = FavoritePokemonEntity(
    name = name, id = null,
)

fun FavoritePokemonEntity.toFavoriteEntity() = FavoritePokemon(
    name = name
)