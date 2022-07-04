package br.com.cwi.nespresso_app.data.database.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query
import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity
import br.com.cwi.nespresso_app.data.database.entity.ItemTypeEntity

@Dao
interface FavorityDao {

    @Insert
    fun add(favorityEntity: FavorityEntity)

    @Delete
    fun remove(favorityEntity: FavorityEntity)

    @Query("SELECT * FROM FavorityEntity")
    fun getAll(): List<FavorityEntity>?

    @Query("SELECT * FROM FavorityEntity WHERE idProduct=:id AND type=:type")
    fun getFavorityByIdAndType(id: Int, type: ItemTypeEntity): FavorityEntity?

    @Query("SELECT * FROM FavorityEntity WHERE type==:type")
    fun findAllFavorityByType(type: ItemTypeEntity): List<FavorityEntity>?
}