package br.com.cwi.nespresso_app.data.mapper

import br.com.cwi.nespresso_app.data.entity.ItemResponse
import br.com.cwi.nespresso_app.domain.entity.Item

class ItemMapper: DomainMapper<ItemResponse, Item> {
    override fun toDomain(from: ItemResponse) = Item(
        id = from.id,
        name = from.name,
        unitPrice =  from.price,
        urlImage = from.urlImage,
        description = from.description
    )

    override fun toDomain(from: List<ItemResponse>) = from.map {
        toDomain(it)
    }

}