package br.com.cwi.nespresso_app.data.network

import br.com.cwi.nespresso_app.data.entity.AcessoryResponse
import br.com.cwi.nespresso_app.data.entity.CategoryResponse
import br.com.cwi.nespresso_app.data.entity.MachineResponse
import retrofit2.http.GET

interface NespressoApi {

    @GET("/capsulas")
    suspend fun getCoffees(): List<CategoryResponse>

    @GET("/maquinas")
    suspend fun getMachines(): List<MachineResponse>

    @GET("/acessorios")
    suspend fun getAcessories(): List<AcessoryResponse>
}