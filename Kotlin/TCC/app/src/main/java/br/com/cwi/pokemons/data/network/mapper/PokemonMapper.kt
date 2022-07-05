package br.com.cwi.pokemons.data.network.mapper

import br.com.cwi.pokemons.data.network.entity.PokemonResponse
import br.com.cwi.pokemons.domain.entity.Pokemon

class PokemonMapper : DomainMapper<PokemonResponse, Pokemon> {
    override fun toDomain(from: PokemonResponse): Pokemon {
        return Pokemon(
            id = from.id,
            height = from.height,
            weight = from.weight,
            name = from.name,
            image = from.sprites.image
        )
    }

    override fun toDomain(from: List<PokemonResponse>): List<Pokemon> = from.map {
        toDomain(it)
    }
}