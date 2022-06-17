package br.com.cwi.nespresso_app.data.entity

import com.squareup.moshi.Json

class ItemResponse(
    @Json(name="id") val id: Int,
    @Json(name="nome") val name: String,
    @Json(name="preco") val price: Double,
    @Json(name="imagem") val urlImage: String,
    @Json(name="descricao") val description: String?
) : AcessoryType (type = 1)