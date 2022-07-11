package br.com.cwi.pokemons.data.repository

import br.com.cwi.pokemons.data.database.AppDatabase
import br.com.cwi.pokemons.data.database.mapper.toFavoriteEntity
import br.com.cwi.pokemons.domain.entity.FavoritePokemon
import br.com.cwi.pokemons.domain.repository.FavoritePokemonRepository

class FavoritePokemonRepositoryImpl(
    appDatabase: AppDatabase,
) : FavoritePokemonRepository {

    private val dao = appDatabase.getFavoritePokemonDao()

    override suspend fun removeFavoritePokemonsByName(name: String) {
        dao.removeByName(name)
    }

    override suspend fun addFavoritePokemons(favoritePokemon: FavoritePokemon) {
        dao.add(favoritePokemon.toFavoriteEntity())
    }

    override suspend fun getFavoritePokemons(): List<FavoritePokemon>? {
        return dao.getAll()?.map {
            it.toFavoriteEntity()
        }
    }

    override suspend fun getFavoritePokemon(name: String): FavoritePokemon? {
        return dao.getFavoritePokemonByName(name)?.let {
            it.toFavoriteEntity()
        }
    }

    override suspend fun isFavoritePokemon(name: String): Boolean {
        return dao.isFavoritePokemon(name)
    }
}