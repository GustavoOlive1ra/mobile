package br.com.cwi.nespresso_app.domain.repository

import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity
import br.com.cwi.nespresso_app.data.database.entity.ItemTypeEntity

interface CoffeeLocalRepository {
    fun add(favorityEntity: FavorityEntity)
    fun remove(favorityEntity: FavorityEntity)
    fun getAll(): List<FavorityEntity>?
    fun getFavorityByIdAndType(id: Int, type: ItemTypeEntity): FavorityEntity?
    fun findAllFavorityByType(type: ItemTypeEntity): List<FavorityEntity>?
}