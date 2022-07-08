package br.com.cwi.pokemons.data.database.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query
import br.com.cwi.pokemons.data.database.entity.UnlockedPokemonEntity

@Dao
interface UnlockedPokemonDao {
    @Insert
    fun add(unlockedPokemonEntity: UnlockedPokemonEntity)

    @Delete
    fun remove(unlockedPokemonEntity: UnlockedPokemonEntity)

    @Query("SELECT * FROM UnlockedPokemonEntity")
    fun getAll(): List<UnlockedPokemonEntity>?

    @Query("SELECT * FROM UnlockedPokemonEntity WHERE name=:name")
    fun getUnlockedPokemonByName(name: String): UnlockedPokemonEntity?

    @Query("SELECT EXISTS(SELECT * FROM UnlockedPokemonEntity WHERE name=:name)")
    fun isUnlockedPokemon(name: String) : Boolean
}