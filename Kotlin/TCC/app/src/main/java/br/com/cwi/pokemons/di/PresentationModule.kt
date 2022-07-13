package br.com.cwi.pokemons.di

import br.com.cwi.pokemons.presentation.features.battle.BattleViewModel
import br.com.cwi.pokemons.presentation.features.pokemons.PokemonDetailViewModel
import br.com.cwi.pokemons.presentation.features.pokemons.PokemonsViewModel
import br.com.cwi.pokemons.presentation.features.profile.ProfileActivity
import br.com.cwi.pokemons.presentation.features.profile.ProfileViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val presentationModule = module {
    viewModel { PokemonsViewModel(get(), get(), get()) }
    viewModel { PokemonDetailViewModel(get(), get(), get()) }
    viewModel { ProfileViewModel(get()) }
    viewModel { BattleViewModel(get(),get()) }
}