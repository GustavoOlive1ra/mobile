package br.com.cwi.pokemons.di

import br.com.cwi.pokemons.presentation.features.pokemons.PokemonDetailViewModel
import br.com.cwi.pokemons.presentation.features.pokemons.PokemonsViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val presentationModule = module {
    viewModel { PokemonsViewModel(get()) }
    viewModel { PokemonDetailViewModel(get()) }
}