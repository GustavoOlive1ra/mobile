package br.com.cwi.nespresso_app.data.repository

import br.com.cwi.nespresso_app.data.entity.AcessoryResponse
import br.com.cwi.nespresso_app.data.mapper.AcessoryMapper
import br.com.cwi.nespresso_app.data.mapper.CategoryMapper
import br.com.cwi.nespresso_app.data.mapper.MachineMapper
import br.com.cwi.nespresso_app.data.network.NespressoApi
import br.com.cwi.nespresso_app.data.network.RetrofitConfig
import br.com.cwi.nespresso_app.domain.entity.Acessory
import br.com.cwi.nespresso_app.domain.entity.Category
import br.com.cwi.nespresso_app.domain.entity.Machine
import br.com.cwi.nespresso_app.domain.repository.CoffeeRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class CoffeeRepositoryImpl(
    private val categoryMapper: CategoryMapper,
    private val machineMapper: MachineMapper,
    private val acessoryMapper: AcessoryMapper
) : CoffeeRepository {

    private val api: NespressoApi = RetrofitConfig.service

    override suspend fun getCoffees(): List<Category> {
        return withContext(Dispatchers.IO) {
            categoryMapper.toDomain(api.getCoffees())
        }
    }

    override suspend fun getMachines(): List<Machine> {
        return withContext(Dispatchers.IO) {
            machineMapper.toDomain(api.getMachines())
        }
    }

    override suspend fun getAcessories(): List<Acessory> {
        return withContext(Dispatchers.IO) {
            acessoryMapper.toDomain(api.getAcessories())
        }
    }

}