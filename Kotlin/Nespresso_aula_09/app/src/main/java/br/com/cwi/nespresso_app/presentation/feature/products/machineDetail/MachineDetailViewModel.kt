package br.com.cwi.nespresso_app.presentation.feature.products.machineDetail

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import br.com.cwi.nespresso_app.domain.entity.Machine
import br.com.cwi.nespresso_app.domain.repository.CoffeeRepository
import br.com.cwi.nespresso_app.presentation.base.BaseViewModel

class MachineDetailViewModel(private val repository: CoffeeRepository): BaseViewModel() {

    private val _machine = MutableLiveData<Machine>()
    val machine: LiveData<Machine> = _machine

    fun fetchMachineDetail(id: Int) {
        launch {
            val machineList = repository.getMachineDetails(id)
            _machine.postValue(machineList)
        }
    }
}