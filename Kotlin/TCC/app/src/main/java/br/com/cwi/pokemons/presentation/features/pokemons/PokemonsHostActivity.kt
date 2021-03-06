package br.com.cwi.pokemons.presentation.features.pokemons

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.fragment.findNavController
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.ActivityPokemonsHostBinding
import br.com.cwi.pokemons.presentation.base.BaseBottomNavigation
import br.com.cwi.pokemons.presentation.extension.visibleOrGone
import com.google.android.material.bottomnavigation.BottomNavigationView
import org.koin.androidx.viewmodel.ext.android.viewModel

class PokemonsHostActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityPokemonsHostBinding

    private val viewModel : PokemonsViewModel by viewModel()

    private val navController by lazy{
        (supportFragmentManager.findFragmentById(binding.navHostContainner.id) as NavHostFragment).findNavController()
    }
    override val currentTab: Int = R.id.home_menu

    override fun getBottomNavigation(): BottomNavigationView = binding.bottomNavigation

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPokemonsHostBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setUpViewModel()
    }

    private fun setUpViewModel() {
        viewModel.loading.observe(this) { isLoading ->
            binding.viewLoading.root.visibleOrGone(isLoading)
        }
        viewModel.error.observe(this) { isError ->
            binding.viewError.root.visibleOrGone(isError)
            binding.navHostContainner.visibleOrGone(!isError)
        }
        viewModel.fetchPokemons()
    }

}