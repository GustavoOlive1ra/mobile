package br.com.cwi.pokemons.di

import org.koin.core.module.Module

val appModules : List<Module> = listOf(dataModule, presentationModule)