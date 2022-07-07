package br.com.cwi.pokemons.di

import br.com.cwi.pokemons.data.network.RetrofitConfig
import br.com.cwi.pokemons.data.network.mapper.FlavorTextEntriesMapper
import br.com.cwi.pokemons.data.network.mapper.PokemonBaseMapper
import br.com.cwi.pokemons.data.network.mapper.PokemonDetailMapper
import br.com.cwi.pokemons.data.network.mapper.PokemonSpeciesMapper
import br.com.cwi.pokemons.data.repository.PokemonRepositoryImpl
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import org.koin.dsl.module

val dataModule = module {

    single { RetrofitConfig.service }
    single { PokemonDetailMapper() }
    single { PokemonBaseMapper() }
    single { FlavorTextEntriesMapper() }
    single { PokemonSpeciesMapper(get()) }

    factory<PokemonRepository> { PokemonRepositoryImpl(get(), get(), get(), get()) }
}