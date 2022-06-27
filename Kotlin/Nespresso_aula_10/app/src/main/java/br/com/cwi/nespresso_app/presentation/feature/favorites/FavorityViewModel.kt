package br.com.cwi.nespresso_app.presentation.feature.favorites

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity
import br.com.cwi.nespresso_app.domain.repository.CoffeeLocalRepository
import br.com.cwi.nespresso_app.presentation.base.BaseViewModel

class FavorityViewModel(
    private val coffeeLocalRepository: CoffeeLocalRepository
) : BaseViewModel() {

    private val _favority = MutableLiveData<List<FavorityEntity>>()
    val favority: LiveData<List<FavorityEntity>> = _favority

    fun fetchFavority() {
        launch {
            _favority.postValue(coffeeLocalRepository.getAll())
        }
    }
}