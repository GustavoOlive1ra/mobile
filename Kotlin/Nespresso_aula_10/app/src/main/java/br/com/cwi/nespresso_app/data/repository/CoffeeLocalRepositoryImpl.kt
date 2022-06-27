package br.com.cwi.nespresso_app.data.repository

import br.com.cwi.nespresso_app.data.database.AppDatabase
import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity
import br.com.cwi.nespresso_app.data.database.entity.ItemTypeEntity
import br.com.cwi.nespresso_app.domain.repository.CoffeeLocalRepository

class CoffeeLocalRepositoryImpl(
    appDatabase: AppDatabase
) : CoffeeLocalRepository {

    private val dao = appDatabase.getCoffeeDao()

    override fun add(favorityEntity: FavorityEntity) {
        dao.add(favorityEntity)
    }

    override fun remove(favorityEntity: FavorityEntity) {
        dao.remove(favorityEntity)
    }

    override fun getAll(): List<FavorityEntity>? = dao.getAll()

    override fun getFavorityByIdAndType(id: Int, type: ItemTypeEntity): FavorityEntity? {
       return dao.getFavorityByIdAndType(id, type)
    }

    override fun findAllFavorityByType(type: ItemTypeEntity) = dao.findAllFavorityByType(type)

}