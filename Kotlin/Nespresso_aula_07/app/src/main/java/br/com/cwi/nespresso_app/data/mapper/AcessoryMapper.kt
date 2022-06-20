package br.com.cwi.nespresso_app.data.mapper

import br.com.cwi.nespresso_app.data.entity.AcessoryResponse
import br.com.cwi.nespresso_app.data.entity.CategoryResponse
import br.com.cwi.nespresso_app.domain.entity.Acessory
import br.com.cwi.nespresso_app.domain.entity.Category

class AcessoryMapper: DomainMapper<AcessoryResponse, Acessory> {
    override fun toDomain(from: AcessoryResponse) = Acessory(
        category = from.category,
        itens = ItemMapper().toDomain(from.itens)
    )

    override fun toDomain(from: List<AcessoryResponse>) = from.map {
        toDomain(it)
    }
}