package br.com.cwi.pokemons.di

import br.com.cwi.pokemons.data.network.RetrofitConfig
import br.com.cwi.pokemons.data.network.mapper.*
import br.com.cwi.pokemons.data.repository.PokemonRepositoryImpl
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import org.koin.dsl.module

val dataModule = module {

    single { RetrofitConfig.service }
    single { PokemonDetailMapper(get()) }
    single { PokemonBaseMapper() }
    single { FlavorTextEntriesMapper() }
    single { PokemonSpeciesMapper(get()) }
    single { StatusMapper() }

    factory<PokemonRepository> { PokemonRepositoryImpl(get(), get(), get(), get()) }
}