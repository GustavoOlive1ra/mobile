package br.com.cwi.pokemons.data.database.dao

import androidx.room.*
import br.com.cwi.pokemons.data.database.entity.ProfileEntity
@Dao
interface ProfileDao {
    @Insert
    fun add(profileEntity: ProfileEntity)

    @Delete
    fun remove(profileEntity: ProfileEntity)

    @Update
    fun update(profileEntity: ProfileEntity)

    @Query("SELECT * FROM ProfileEntity")
    fun getAll(): List<ProfileEntity>?

    @Query("SELECT * FROM ProfileEntity WHERE id=:id")
    fun getProfileById(id: Int): ProfileEntity?

}