package br.com.cwi.pokemons.domain.repository

import br.com.cwi.pokemons.domain.entity.FavoritePokemon

interface FavoritePokemonRepository {
    suspend fun removeFavoritePokemonsByName(name: String)
    suspend fun addFavoritePokemons(favoritePokemon: FavoritePokemon)
    suspend fun getFavoritePokemons(): List<FavoritePokemon>?
    suspend fun getFavoritePokemon(name: String): FavoritePokemon?
    suspend fun isFavoritePokemon(name: String): Boolean
}