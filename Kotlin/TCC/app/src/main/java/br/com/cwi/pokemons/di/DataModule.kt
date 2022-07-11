package br.com.cwi.pokemons.di

import br.com.cwi.pokemons.data.database.AppDatabase
import br.com.cwi.pokemons.data.network.RetrofitConfig
import br.com.cwi.pokemons.data.network.mapper.*
import br.com.cwi.pokemons.data.repository.FavoritePokemonRepositoryImpl
import br.com.cwi.pokemons.data.repository.PokemonRepositoryImpl
import br.com.cwi.pokemons.data.repository.ProfileRepositoryImpl
import br.com.cwi.pokemons.data.repository.UnlockedPokemonRepositoryImpl
import br.com.cwi.pokemons.domain.repository.FavoritePokemonRepository
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import br.com.cwi.pokemons.domain.repository.ProfileRepository
import br.com.cwi.pokemons.domain.repository.UnlockedPokemonRepository
import org.koin.android.ext.koin.androidApplication
import org.koin.dsl.module

val dataModule = module {

    single { RetrofitConfig.service }
    single { PokemonDetailMapper(get(),get()) }
    single { PokemonBaseMapper() }
    single { AbilitiesMapper() }
    single { FlavorTextEntriesMapper() }
    single { PokemonSpeciesMapper(get()) }
    single { StatusMapper() }

    single { AppDatabase.create(androidApplication()) }

    factory<PokemonRepository> { PokemonRepositoryImpl(get(), get(), get(), get()) }
    factory<UnlockedPokemonRepository> { UnlockedPokemonRepositoryImpl(get()) }
    factory<FavoritePokemonRepository> { FavoritePokemonRepositoryImpl(get()) }
    factory<ProfileRepository> { ProfileRepositoryImpl(get()) }
}