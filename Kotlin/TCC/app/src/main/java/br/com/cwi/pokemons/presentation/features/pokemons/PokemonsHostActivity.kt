package br.com.cwi.pokemons.presentation.features.pokemons

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.fragment.findNavController
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.ActivityPokemonsHostBinding
import org.koin.androidx.viewmodel.ext.android.viewModel

class PokemonsHostActivity : AppCompatActivity() {

    private lateinit var binding: ActivityPokemonsHostBinding

    private val viewModel : PokemonsViewModel by viewModel()

    private val navController by lazy{
        (supportFragmentManager.findFragmentById(binding.navHostContainner.id) as NavHostFragment).findNavController()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPokemonsHostBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setUpViewModel()
    }

    private fun setUpViewModel() {
        viewModel.fetchPokemons()
    }

}