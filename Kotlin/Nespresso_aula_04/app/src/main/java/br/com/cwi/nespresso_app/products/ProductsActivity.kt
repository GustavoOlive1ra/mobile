package br.com.cwi.nespresso_app.products

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.bag.BagActivity
import br.com.cwi.nespresso_app.databinding.ActivityProductsBinding
import br.com.cwi.nespresso_app.favorites.FavoritesActivity
import br.com.cwi.nespresso_app.products.coffee.CoffeeActivity

class ProductsActivity : AppCompatActivity() {

    private lateinit var binding: ActivityProductsBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityProductsBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setUpProductsActions()
        setUpBottomNavigation()
    }

    override fun onResume() {
        super.onResume()

        binding.bottomNavigation.selectedItemId = R.id.products_menu
    }

    override fun onPause() {
        super.onPause()
        overridePendingTransition(0, 0)
    }

    private fun setUpProductsActions() {
        binding.contentCoffees.root.setOnClickListener {
            val intent = Intent(this, CoffeeActivity::class.java)
                .putExtra("EXTRA_MESSAGE", "Olar mundo bem?")

            startActivity(intent)
        }

        binding.contentMachines.root.setOnClickListener {
            AlertDialog.Builder(this)
                .setMessage("Deu bom")
                .setTitle("Click maquinas")
                .show()
        }

        binding.contentAccessories.root.setOnClickListener {
            AlertDialog.Builder(this)
                .setMessage("Deu bom")
                .setTitle("Click acessorios")
                .show()
        }
    }

    private fun setUpBottomNavigation() {
        binding.bottomNavigation.setOnNavigationItemSelectedListener {

            when (it.itemId) {
                R.id.favorites_menu -> {
                    startActivity(Intent(this, FavoritesActivity::class.java))
                }
                R.id.bag_menu -> {
                    startActivity(Intent(this, BagActivity::class.java))
                }
            }
            return@setOnNavigationItemSelectedListener true
        }

    }


}