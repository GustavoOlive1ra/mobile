package br.com.cwi.nespresso_app.data.entity

import com.squareup.moshi.Json

class MachinesResponse(
    @Json(name="maquinas") val machines: List<MachineResponse>
)

class MachineResponse(
    @Json(name="id") val id: Int,
    @Json(name="nome") val name: String,
    @Json(name="preco") val price: Double,
    @Json(name="descricao") val description: String,
    @Json(name="imagem") val imageUrl: String
)