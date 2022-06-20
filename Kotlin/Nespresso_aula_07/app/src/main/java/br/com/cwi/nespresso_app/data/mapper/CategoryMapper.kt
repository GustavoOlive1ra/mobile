package br.com.cwi.nespresso_app.data.mapper

import br.com.cwi.nespresso_app.data.entity.CategoryResponse
import br.com.cwi.nespresso_app.domain.entity.Category

class CategoryMapper: DomainMapper<CategoryResponse, Category> {
    override fun toDomain(from: CategoryResponse) = Category(
        category = from.category,
        coffees = CoffeeMapper().toDomain(from.coffees)
    )

    override fun toDomain(from: List<CategoryResponse>) = from.map {
        toDomain(it)
    }

}