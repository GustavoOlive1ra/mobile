package br.com.cwi.pokemons.data.database.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query
import br.com.cwi.pokemons.data.database.entity.FavoritePokemonEntity

@Dao
interface FavoritePokemonDao {
    @Insert
    fun add(favoritePokemonEntity: FavoritePokemonEntity)

    @Delete
    fun remove(favoritePokemonEntity: FavoritePokemonEntity)

    @Query("DELETE FROM FavoritePokemonEntity WHERE name = :name")
    fun removeByName(name: String)

    @Query("SELECT * FROM FavoritePokemonEntity")
    fun getAll(): List<FavoritePokemonEntity>?

    @Query("SELECT * FROM FavoritePokemonEntity WHERE name=:name")
    fun getFavoritePokemonByName(name: String): FavoritePokemonEntity?

    @Query("SELECT EXISTS(SELECT * FROM FavoritePokemonEntity WHERE name=:name)")
    fun isFavoritePokemon(name: String): Boolean

    @Query("SELECT COUNT(id) FROM FavoritePokemonEntity")
    fun getCountFavority(): Int
}