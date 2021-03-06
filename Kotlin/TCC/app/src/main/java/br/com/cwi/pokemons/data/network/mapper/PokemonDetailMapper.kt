package br.com.cwi.pokemons.data.network.mapper

import br.com.cwi.pokemons.data.network.entity.PokemonDetailResponse
import br.com.cwi.pokemons.domain.entity.PokemonDetail

class PokemonDetailMapper(
    val statusMapper: StatusMapper,
    val abilitiesMapper: AbilitiesMapper,
    val typeMapper: TypeMapper
) :
    DomainMapper<PokemonDetailResponse, PokemonDetail> {

    override fun toDomain(from: PokemonDetailResponse): PokemonDetail {
        return PokemonDetail(
            id = from.id,
            height = from.height,
            weight = from.weight,
            name = from.name,
            image = from.spritesResponse.image,
            status = statusMapper.toDomain(from.status),
            ability = abilitiesMapper.toDomain(from.abilities),
            type = typeMapper.toDomain(from.types)
        )
    }

    override fun toDomain(from: List<PokemonDetailResponse>): List<PokemonDetail> = from.map {
        toDomain(it)
    }
}