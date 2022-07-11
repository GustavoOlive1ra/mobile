package br.com.cwi.pokemons.data.database.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query
import br.com.cwi.pokemons.data.database.entity.ProfileEntity
@Dao
interface ProfileDao {
    @Insert
    fun add(profileEntity: ProfileEntity)

    @Delete
    fun remove(profileEntity: ProfileEntity)

    @Query("SELECT * FROM ProfileEntity")
    fun getAll(): List<ProfileEntity>?

    @Query("SELECT * FROM ProfileEntity WHERE id=:id")
    fun getProfileById(id: Int): ProfileEntity?

}