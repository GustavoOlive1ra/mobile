package br.com.cwi.pokemons.data.repository

import br.com.cwi.pokemons.data.database.AppDatabase
import br.com.cwi.pokemons.data.database.entity.ProfileEntity
import br.com.cwi.pokemons.data.database.mapper.toProfile
import br.com.cwi.pokemons.data.database.mapper.toProfileEntity
import br.com.cwi.pokemons.domain.entity.Profile
import br.com.cwi.pokemons.domain.repository.ProfileRepository

class ProfileRepositoryImpl (
    appDatabase: AppDatabase,
) : ProfileRepository {

    private val dao = appDatabase

    override suspend fun addProfile(profile: Profile) {
        dao.getProfileDao().add(profile.toProfileEntity())
    }

    override suspend fun updateProfile(profile: Profile) {
        dao.getProfileDao().update(profile.toProfileEntity())
    }

    override suspend fun getProfileById(id: Int): Profile? {
        val profile = dao.getProfileDao().getProfileById(id) ?: profileDefault()
        profile.apply{
                this.qtdUnlocked = dao.getUnlockedPokemonDao().getCountUnlocked()
                this.qtdFavorite = dao.getFavoritePokemonDao().getCountFavority()
        }
        return profile.toProfile()
    }

    private fun profileDefault(): ProfileEntity{
        return ProfileEntity(id = null, name = "Your name", qtdUnlocked = 0, qtdFavorite = 0, image = null)
    }
}