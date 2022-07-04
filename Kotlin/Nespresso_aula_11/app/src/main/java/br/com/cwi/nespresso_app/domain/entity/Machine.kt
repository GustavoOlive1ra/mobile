package br.com.cwi.nespresso_app.domain.entity

class Machine(
    id: Int,
    var description: String,
    name: String,
    urlImage: String?,
    unitPrice: Double,
    var isFavorite: Boolean = false
) : Product(id, name, urlImage, unitPrice)