package br.com.cwi.pokemons.data.database.mapper

import br.com.cwi.pokemons.data.database.entity.UnlockedPokemonEntity
import br.com.cwi.pokemons.domain.entity.UnlockedPokemon

fun UnlockedPokemon.toUnlockedEntity() = UnlockedPokemonEntity (
    name= name, id= null,
)

fun UnlockedPokemonEntity.toUnlocked() = UnlockedPokemon (
    name= name
)