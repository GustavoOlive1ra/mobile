package br.com.cwi.nespresso_app.favorites

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.bag.BagActivity
import br.com.cwi.nespresso_app.databinding.ActivityFavoritesBinding
import br.com.cwi.nespresso_app.databinding.ActivityProductsBinding
import br.com.cwi.nespresso_app.products.ProductsActivity
import br.com.cwi.nespresso_app.products.base.BaseBottomNavigation

class FavoritesActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityFavoritesBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityFavoritesBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setUpBottomNavigation()
    }

    override fun onPause() {
        super.onPause()
        overridePendingTransition(0, 0)
    }

    override fun onResume() {
        super.onResume()
        binding.bottomNavigation.selectedItemId = R.id.favorites_menu
    }

    private fun setUpBottomNavigation() {
        binding.bottomNavigation.setOnNavigationItemSelectedListener {

            when (it.itemId) {
                R.id.products_menu -> {
                    startActivity(Intent(this, ProductsActivity::class.java))
                }
                R.id.bag_menu -> {
                    startActivity(Intent(this, BagActivity::class.java))
                }
            }
            return@setOnNavigationItemSelectedListener true
        }
    }

}