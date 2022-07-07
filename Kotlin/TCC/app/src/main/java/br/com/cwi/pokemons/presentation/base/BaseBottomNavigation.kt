package br.com.cwi.pokemons.presentation.base

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.presentation.features.pokemons.PokemonsHostActivity
import br.com.cwi.pokemons.presentation.features.profile.ProfileActivity
import com.google.android.material.bottomnavigation.BottomNavigationView

abstract class BaseBottomNavigation: AppCompatActivity() {

    abstract val currentTab: Int

    abstract fun getBottomNavigation(): BottomNavigationView

    override fun onPause() {
        super.onPause()
        overridePendingTransition(0, 0)
    }

    override fun onResume() {
        super.onResume()
        setUpBottomNavigationActions()
        selectCurrentTab()
    }

    private fun setUpBottomNavigationActions() {
        getBottomNavigation().setOnItemSelectedListener {
            if (it.itemId != this.currentTab) when (it.itemId) {
                R.id.home_menu -> {
                    val intent = Intent(this, PokemonsHostActivity::class.java)
                    startActivity(intent)
                }
                R.id.profile_menu -> {
                    val intent = Intent(this, ProfileActivity::class.java)
                    startActivity(intent)
                }
            }
            return@setOnItemSelectedListener true
        }
    }

    private fun selectCurrentTab() {
        getBottomNavigation().selectedItemId = currentTab
    }
}