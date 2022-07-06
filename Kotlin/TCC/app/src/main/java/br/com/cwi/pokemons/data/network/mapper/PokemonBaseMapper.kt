package br.com.cwi.pokemons.data.network.mapper

import br.com.cwi.pokemons.data.network.entity.PokemonBaseResponse
import br.com.cwi.pokemons.domain.entity.Pokemons

const val URL_IMAGE_BASE = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
const val LAST_BUT_ONE = 1
const val FORMAT_IMAGE = ".png"

class PokemonBaseMapper : DomainMapper<PokemonBaseResponse, Pokemons> {

    override fun toDomain(from: PokemonBaseResponse): Pokemons {
        return Pokemons(name = from.name, url = from.url, image = getUrlImage(from.url)
        )
    }

    override fun toDomain(from: List<PokemonBaseResponse>): List<Pokemons> = from.map {
        toDomain(it)
    }


    private fun getUrlImage(urlAcess: String): String{
        val urlDivida = urlAcess.split("/")
        val idPokemon =  urlDivida.get(urlDivida.lastIndex - LAST_BUT_ONE)
        return URL_IMAGE_BASE + idPokemon + FORMAT_IMAGE
    }

}