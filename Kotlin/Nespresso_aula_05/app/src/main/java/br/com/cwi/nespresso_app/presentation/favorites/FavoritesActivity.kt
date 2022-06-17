package br.com.cwi.nespresso_app.presentation.favorites

import android.os.Bundle
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigationActivity
import br.com.cwi.nespresso_app.databinding.ActivityFavoritesBinding
import com.google.android.material.bottomnavigation.BottomNavigationView

class FavoritesActivity : BaseBottomNavigationActivity() {

    private lateinit var binding : ActivityFavoritesBinding

    override val currentTab: Int = R.id.favorites_menu

    override fun onCreate(savedInstanceState: Bundle?) {
        binding = ActivityFavoritesBinding.inflate(layoutInflater)
        setContentView(binding.root)
        super.onCreate(savedInstanceState)
    }

    override fun getBottomNavigation(): BottomNavigationView = binding.bottomNavigation
}