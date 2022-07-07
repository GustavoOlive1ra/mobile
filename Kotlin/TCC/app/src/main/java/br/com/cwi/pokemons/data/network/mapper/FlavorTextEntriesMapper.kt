package br.com.cwi.pokemons.data.network.mapper

import br.com.cwi.pokemons.data.network.entity.FlavorTextEntriesResponse
import br.com.cwi.pokemons.domain.entity.FlavorTextEntries

class FlavorTextEntriesMapper : DomainMapper<FlavorTextEntriesResponse, FlavorTextEntries> {

    override fun toDomain(from: FlavorTextEntriesResponse): FlavorTextEntries {
        return FlavorTextEntries(
            text = from.text,
            language = from.language.name
        )
    }

    override fun toDomain(from: List<FlavorTextEntriesResponse>): List<FlavorTextEntries> =
        from.map {
            toDomain(it)
        }
}