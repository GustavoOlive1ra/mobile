package br.com.cwi.nespresso_app.presentation.feature.products.machine

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity
import br.com.cwi.nespresso_app.data.database.entity.ItemTypeEntity
import br.com.cwi.nespresso_app.data.database.mapper.toFavorityEntity
import br.com.cwi.nespresso_app.domain.entity.Machine
import br.com.cwi.nespresso_app.domain.repository.CoffeeLocalRepository
import br.com.cwi.nespresso_app.domain.repository.CoffeeRepository
import br.com.cwi.nespresso_app.presentation.base.BaseViewModel

class MachineViewModel(private val repository: CoffeeRepository,
                       private val coffeeLocalRepository: CoffeeLocalRepository): BaseViewModel() {

    private val _machines = MutableLiveData<List<Machine>>()
    val machines: LiveData<List<Machine>> = _machines

    fun fetchMachines() {
        launch {
            val machineList = repository.getMachines()
            val favoriteList = coffeeLocalRepository.findAllFavorityByType(ItemTypeEntity.MACHINE)

            machineList.forEach { machine->
                favoriteList?.takeIf { it.isNotEmpty() }?.let { favoriteList ->
                    setIsMachineFavorite(favoriteList.map { it.idProduct }, machineList)
                }
            }
            _machines.postValue(machineList)
        }
    }

    private fun setIsMachineFavorite(favoriteIdList: List<Int>, machineList: List<Machine>) {
        machineList.forEach { id ->
            id.isFavorite=(favoriteIdList.contains(id.id))
        }
    }

    fun setFavorite(machine: Machine) {
        val machineEntity = findMachineFavority(machine) ?: machine.toFavorityEntity()
        if (machine.isFavorite) coffeeLocalRepository.add(machineEntity)
        else coffeeLocalRepository.remove(machineEntity)
    }

    private fun findMachineFavority(machine: Machine): FavorityEntity?{
        return coffeeLocalRepository.getFavorityByIdAndType(machine.id, ItemTypeEntity.MACHINE)
    }

}