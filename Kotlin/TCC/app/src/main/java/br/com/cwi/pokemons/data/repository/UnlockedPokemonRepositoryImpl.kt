package br.com.cwi.pokemons.data.repository

import br.com.cwi.pokemons.data.database.AppDatabase
import br.com.cwi.pokemons.data.database.mapper.toUnlocked
import br.com.cwi.pokemons.data.database.mapper.toUnlockedEntity
import br.com.cwi.pokemons.domain.entity.UnlockedPokemon
import br.com.cwi.pokemons.domain.repository.UnlockedPokemonRepository

class UnlockedPokemonRepositoryImpl(
    appDatabase: AppDatabase,
) : UnlockedPokemonRepository {

    private val dao = appDatabase.getUnlockedPokemonDao()

    override suspend fun addUnlockedPokemons(unlockedPokemon: UnlockedPokemon) {
        dao.add(unlockedPokemon.toUnlockedEntity())
    }

    override suspend fun getUnlockedPokemons(): List<UnlockedPokemon>? {
        return dao.getAll()?.map {
            it.toUnlocked()
        }
    }

    override suspend fun getUnlockedPokemon(name: String): UnlockedPokemon? {
        return dao.getUnlockedPokemonByName(name)?.let {
            it.toUnlocked()
        }
    }

    override suspend fun isUnlockedPokemon(name: String): Boolean {
        return dao.isUnlockedPokemon(name)
    }
}