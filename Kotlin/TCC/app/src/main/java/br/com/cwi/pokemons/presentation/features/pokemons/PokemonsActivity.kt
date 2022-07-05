package br.com.cwi.pokemons.presentation.features.pokemons

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import br.com.cwi.pokemons.R
import org.koin.androidx.viewmodel.ext.android.viewModel

class PokemonsActivity : AppCompatActivity() {

    private val viewModel : PokemonsViewModel by viewModel()


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pokemons)

        viewModel.fetchPokemons()
    }

}