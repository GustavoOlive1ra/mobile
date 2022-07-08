package br.com.cwi.pokemons.data.network.mapper

import br.com.cwi.pokemons.data.network.entity.StatusResponse
import br.com.cwi.pokemons.domain.entity.Status

class StatusMapper : DomainMapper<StatusResponse, Status> {

    override fun toDomain(from: StatusResponse): Status {
        return Status(
            value = from.value,
            name = from.stat.name
        )
    }

    override fun toDomain(from: List<StatusResponse>): List<Status> = from.map {
        toDomain(it)
    }
}