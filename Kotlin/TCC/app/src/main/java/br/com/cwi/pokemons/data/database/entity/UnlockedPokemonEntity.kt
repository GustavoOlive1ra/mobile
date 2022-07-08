package br.com.cwi.pokemons.data.database.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
class UnlockedPokemonEntity (
    @PrimaryKey(autoGenerate = true) val id: Int?,
    val name: String,
)