package br.com.cwi.pokemons.domain.repository

import br.com.cwi.pokemons.domain.entity.Profile

interface ProfileRepository {
    suspend fun addProfile(profile: Profile)
    suspend fun getProfileById(id: Int): Profile?
}