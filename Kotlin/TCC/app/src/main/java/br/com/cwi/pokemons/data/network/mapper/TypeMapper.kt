package br.com.cwi.pokemons.data.network.mapper

import br.com.cwi.pokemons.data.network.entity.TypesResponse
import br.com.cwi.pokemons.domain.entity.Type

class TypeMapper : DomainMapper<TypesResponse, Type> {

    override fun toDomain(from: TypesResponse): Type {
        return Type(
            name = from.type.name
        )
    }

    override fun toDomain(from: List<TypesResponse>): List<Type> = from.map {
        toDomain(it)
    }
}