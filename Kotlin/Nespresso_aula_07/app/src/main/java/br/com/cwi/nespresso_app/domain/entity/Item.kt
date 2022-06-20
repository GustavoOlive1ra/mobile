package br.com.cwi.nespresso_app.domain.entity

class Item(
    id: Int,
    name: String,
    urlImage: String?,
    unitPrice: Double,
    val description: String?,
): Product(
    id,
    name,
    urlImage,
    unitPrice
)