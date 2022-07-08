package br.com.cwi.pokemons.data.network.mapper

import br.com.cwi.pokemons.data.network.entity.AbilitiesResponse
import br.com.cwi.pokemons.domain.entity.Ability

class AbilitiesMapper : DomainMapper<AbilitiesResponse, Ability> {

    override fun toDomain(from: AbilitiesResponse): Ability {
        return Ability(
            name = from.ability.name
        )
    }

    override fun toDomain(from: List<AbilitiesResponse>): List<Ability> =
        from.map {
            toDomain(it)
        }
}