package br.com.cwi.pokemons.presentation.features.profile

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.ActivityPokemonsHostBinding
import br.com.cwi.pokemons.databinding.ActivityProfileBinding
import br.com.cwi.pokemons.domain.entity.Profile
import br.com.cwi.pokemons.presentation.base.BaseBottomNavigation
import br.com.cwi.pokemons.presentation.extension.visibleOrGone
import br.com.cwi.pokemons.presentation.features.pokemons.PokemonsViewModel
import com.google.android.material.bottomnavigation.BottomNavigationView
import org.koin.androidx.viewmodel.ext.android.viewModel

class ProfileActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityProfileBinding

    override val currentTab: Int =R.id.profile_menu

    override fun getBottomNavigation(): BottomNavigationView = binding.bottomNavigation

    private val viewModel : ProfileViewModel by viewModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setUpViewModel()
    }

    private fun setUpViewModel() {
        viewModel.profile.observe(this@ProfileActivity) { profile ->
            setUpProfileView(profile = profile)
        }
        viewModel.fetchProfile()
    }

    private fun setUpProfileView(profile: Profile){
        binding.apply {
            tvFavoriteCount.text = profile.qtdFavorite.toString()
            tvUnlockedCount.text = profile.qtdUnlocked.toString()
            tvName.text = profile.name
        }
    }
}