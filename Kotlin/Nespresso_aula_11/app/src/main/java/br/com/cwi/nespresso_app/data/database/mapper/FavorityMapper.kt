package br.com.cwi.nespresso_app.data.database.mapper

import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity
import br.com.cwi.nespresso_app.data.database.entity.ItemTypeEntity
import br.com.cwi.nespresso_app.domain.entity.Accessory
import br.com.cwi.nespresso_app.domain.entity.Coffee
import br.com.cwi.nespresso_app.domain.entity.Machine

fun Coffee.toFavorityEntity() = FavorityEntity (
    idProduct = id, type = ItemTypeEntity.COFFEE, id = null, unitPrice = unitPrice, urlImage = urlImage, name = name
)

fun Machine.toFavorityEntity() = FavorityEntity (
    idProduct = id, type = ItemTypeEntity.MACHINE, id = null, unitPrice = unitPrice, urlImage = urlImage, name = name
)

fun Accessory.toFavorityEntity() = FavorityEntity (
    idProduct = id, type = ItemTypeEntity.ACESSORY, id = null, unitPrice = unitPrice, urlImage = urlImage, name = name
)