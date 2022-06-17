package br.com.cwi.nespresso_app.presentation.base

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.presentation.bag.BagActivity
import br.com.cwi.nespresso_app.presentation.favorites.FavoritesActivity
import br.com.cwi.nespresso_app.presentation.products.ProductsActivity
import com.google.android.material.bottomnavigation.BottomNavigationView

abstract class BaseBottomNavigation : AppCompatActivity() {

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

        getBottomNavigation().setOnNavigationItemSelectedListener {
            if (it.itemId != this.currentTab) when (it.itemId) {
                R.id.products_menu -> {
                    val intent = Intent(this, ProductsActivity::class.java)
                    startActivity(intent)
                }
                R.id.favorites_menu -> {
                    val intent = Intent(this, FavoritesActivity::class.java)
                    startActivity(intent)
                }
                R.id.bag_menu -> {
                    val intent = Intent(this, BagActivity::class.java)
                    startActivity(intent)
                }
            }
            return@setOnNavigationItemSelectedListener true
        }
    }

    private fun selectCurrentTab() {
        getBottomNavigation().selectedItemId = currentTab
    }
}