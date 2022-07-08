package br.com.cwi.pokemons.data.network.mapper

import br.com.cwi.pokemons.data.network.entity.PokemonSpeciesResponse
import br.com.cwi.pokemons.domain.entity.PokemonSpecies

class PokemonSpeciesMapper(private val flavorTextEntriesMapper: FlavorTextEntriesMapper) : DomainMapper<PokemonSpeciesResponse, PokemonSpecies> {

    override fun toDomain(from: PokemonSpeciesResponse): PokemonSpecies {
        return PokemonSpecies(
            description = flavorTextEntriesMapper.toDomain(from.textEntry)
        )
    }

    override fun toDomain(from: List<PokemonSpeciesResponse>): List<PokemonSpecies> = from.map {
        toDomain(it)
    }
}