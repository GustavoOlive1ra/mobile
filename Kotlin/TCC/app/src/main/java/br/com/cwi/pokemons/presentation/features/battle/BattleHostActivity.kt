package br.com.cwi.pokemons.presentation.features.battle

import android.os.Bundle
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.fragment.findNavController
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.ActivityBattleHostBinding
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.presentation.base.BaseBottomNavigation
import br.com.cwi.pokemons.presentation.features.pokemons.fragment.POKEMON_CHOSE
import com.google.android.material.bottomnavigation.BottomNavigationView
import org.koin.androidx.viewmodel.ext.android.viewModel

class BattleHostActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityBattleHostBinding

    private val viewModel: BattleViewModel by viewModel()

    private lateinit var pokemonFirstChose: PokemonDetail

    private val navController by lazy{
        (supportFragmentManager.findFragmentById(binding.navHostContainner.id) as NavHostFragment).findNavController()
    }

    override val currentTab: Int = R.id.home_menu

    override fun getBottomNavigation(): BottomNavigationView = binding.bottomNavigation

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityBattleHostBinding.inflate(layoutInflater)
        setContentView(binding.root)
        intent.getParcelableExtra<PokemonDetail>(POKEMON_CHOSE)?.let { pokemonFirstChose = it }
        setUpViewmodel()
    }

    private fun setUpViewmodel() {
        viewModel.setPokemonFirstChoice(pokemonFirstChose)
        viewModel.fetchPokemons()
    }

}