package br.com.cwi.pokemons.presentation.features.profile

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.ActivityPokemonsHostBinding
import br.com.cwi.pokemons.databinding.ActivityProfileBinding
import br.com.cwi.pokemons.presentation.base.BaseBottomNavigation
import com.google.android.material.bottomnavigation.BottomNavigationView

class ProfileActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityProfileBinding

    override val currentTab: Int =R.id.profile_menu

    override fun getBottomNavigation(): BottomNavigationView = binding.bottomNavigation


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}