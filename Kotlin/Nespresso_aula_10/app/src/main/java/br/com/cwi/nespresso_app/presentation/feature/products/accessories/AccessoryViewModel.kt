package br.com.cwi.nespresso_app.presentation.feature.products.accessories

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity
import br.com.cwi.nespresso_app.data.database.entity.ItemTypeEntity
import br.com.cwi.nespresso_app.data.database.mapper.toFavorityEntity
import br.com.cwi.nespresso_app.domain.entity.Accessory
import br.com.cwi.nespresso_app.domain.entity.Category
import br.com.cwi.nespresso_app.domain.entity.Coffee
import br.com.cwi.nespresso_app.domain.entity.Type
import br.com.cwi.nespresso_app.domain.repository.CoffeeLocalRepository
import br.com.cwi.nespresso_app.domain.repository.CoffeeRepository
import br.com.cwi.nespresso_app.presentation.base.BaseViewModel

class AccessoryViewModel(
    private val repository: CoffeeRepository,
    private val coffeeLocalRepository: CoffeeLocalRepository
) : BaseViewModel() {

    private val _accessories = MutableLiveData<List<Type>>()
    val accessories: LiveData<List<Type>> = _accessories

    fun fetchAccessories() {
        launch {
            val categoryList = repository.getAccessories()
            _accessories.postValue(getTypeList(categoryList))
        }
    }

    private fun getTypeList(categoryList: List<Category>): List<Type> {
        val typeList = mutableListOf<Type>()
        val favoriteList = coffeeLocalRepository.findAllFavorityByType(ItemTypeEntity.ACESSORY)

        categoryList.forEach {
            typeList.add(it)
            favoriteList?.takeIf { it.isNotEmpty() }?.let { favoriteList ->
                setIsAccesoryFavorite(favoriteList.map { it.idProduct }, it.products.map { it as Accessory })
            }
            typeList.addAll(it.products)
        }
        return typeList
    }

    private fun setIsAccesoryFavorite(favoriteIdList: List<Int>, accessoryList: List<Accessory>) {
        accessoryList.forEach { id ->
            id.isFavorite=(favoriteIdList.contains(id.id))
        }
    }

    fun setFavorite(accessory: Accessory) {
        val accessoryEntity = findAccesoryFavority(accessory) ?: accessory.toFavorityEntity()
        if (accessory.isFavorite) coffeeLocalRepository.add(accessoryEntity)
        else coffeeLocalRepository.remove(accessoryEntity)
    }

    private fun findAccesoryFavority(accessory: Accessory): FavorityEntity?{
        return coffeeLocalRepository.getFavorityByIdAndType(accessory.id, ItemTypeEntity.ACESSORY)
    }
}