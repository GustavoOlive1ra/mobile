package br.com.cwi.pokemons.di

import br.com.cwi.pokemons.data.network.RetrofitConfig
import br.com.cwi.pokemons.data.network.mapper.PokemonBaseMapper
import br.com.cwi.pokemons.data.network.mapper.PokemonDatailMapper
import br.com.cwi.pokemons.data.repository.PokemonRepositoryImpl
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import org.koin.dsl.module

val dataModule = module {

    single { RetrofitConfig.service }
    single { PokemonDatailMapper() }
    single { PokemonBaseMapper() }

    factory<PokemonRepository> { PokemonRepositoryImpl(get(), get(), get()) }
}