package br.com.cwi.nespresso_app.di

import br.com.cwi.nespresso_app.presentation.feature.favorites.FavorityViewModel
import br.com.cwi.nespresso_app.presentation.feature.products.accessories.AccessoryViewModel
import br.com.cwi.nespresso_app.presentation.feature.products.coffee.CoffeeViewModel
import br.com.cwi.nespresso_app.presentation.feature.products.machine.MachineViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val presentationModule = module {
    viewModel { CoffeeViewModel(get(), get()) }
    viewModel { MachineViewModel(get(), get()) }
    viewModel { AccessoryViewModel(get(), get()) }
    viewModel { FavorityViewModel(get()) }
}