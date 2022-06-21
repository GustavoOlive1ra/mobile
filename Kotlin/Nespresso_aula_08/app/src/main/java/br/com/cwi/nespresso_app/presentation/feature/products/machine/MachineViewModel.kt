package br.com.cwi.nespresso_app.presentation.feature.products.machine

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import br.com.cwi.nespresso_app.data.mapper.CategoryAccessoryMapper
import br.com.cwi.nespresso_app.data.mapper.CategoryCoffeeMapper
import br.com.cwi.nespresso_app.data.mapper.MachineMapper
import br.com.cwi.nespresso_app.data.repository.CoffeeRepositoryImpl
import br.com.cwi.nespresso_app.domain.entity.Machine
import br.com.cwi.nespresso_app.domain.repository.CoffeeRepository
import br.com.cwi.nespresso_app.presentation.base.BaseViewModel

class MachineViewModel: BaseViewModel()  {

    private val _machine = MutableLiveData<List<Machine>>()
    val machine: LiveData<List<Machine>> = _machine

    private val repository: CoffeeRepository = CoffeeRepositoryImpl(
        CategoryCoffeeMapper(), CategoryAccessoryMapper(), MachineMapper()
    )

    fun fetchMachine(){
        launch {
            _machine.postValue( repository.getMachines())
        }
    }
}