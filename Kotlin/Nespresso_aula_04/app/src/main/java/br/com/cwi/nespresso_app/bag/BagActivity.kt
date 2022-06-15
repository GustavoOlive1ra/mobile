package br.com.cwi.nespresso_app.bag

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.ActivityBagBinding
import br.com.cwi.nespresso_app.favorites.FavoritesActivity
import br.com.cwi.nespresso_app.products.ProductsActivity

class BagActivity : AppCompatActivity() {

    private lateinit var binding: ActivityBagBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityBagBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setUpBottomNavigation()
    }

    override fun onPause() {
        super.onPause()
        overridePendingTransition(0, 0)
    }

    override fun onResume() {
        super.onResume()
        binding.bottomNavigation.selectedItemId = R.id.bag_menu
    }

    private fun setUpBottomNavigation() {
        binding.bottomNavigation.setOnNavigationItemSelectedListener {

            when (it.itemId) {
                R.id.products_menu -> {
                    startActivity(Intent(this, ProductsActivity::class.java))
                }
                R.id.favorites_menu -> {
                    startActivity(Intent(this, FavoritesActivity::class.java))
                }
            }
            return@setOnNavigationItemSelectedListener true
        }
    }

}