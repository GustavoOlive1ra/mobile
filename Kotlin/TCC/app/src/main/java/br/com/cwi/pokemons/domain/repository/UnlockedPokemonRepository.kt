package br.com.cwi.pokemons.domain.repository

import br.com.cwi.pokemons.domain.entity.UnlockedPokemon

interface UnlockedPokemonRepository {
    suspend fun addUnlockedPokemons(unlockedPokemon: UnlockedPokemon)
    suspend fun getUnlockedPokemons(): List<UnlockedPokemon>?
    suspend fun getUnlockedPokemon(name: String): UnlockedPokemon?
    suspend fun isUnlockedPokemon(name: String): Boolean
}
