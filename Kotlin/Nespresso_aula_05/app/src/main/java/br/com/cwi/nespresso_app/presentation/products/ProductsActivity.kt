package br.com.cwi.nespresso_app.presentation.products

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigationActivity
import br.com.cwi.nespresso_app.databinding.ActivityProductsBinding
import br.com.cwi.nespresso_app.presentation.products.coffee.CoffeeActivity
import br.com.cwi.nespresso_app.presentation.products.machines.MachineActivity
import com.google.android.material.bottomnavigation.BottomNavigationView

class ProductsActivity : BaseBottomNavigationActivity() {

    private lateinit var binding: ActivityProductsBinding

    override val currentTab : Int = R.id.products_menu

    override fun onCreate(savedInstanceState: Bundle?) {
        binding = ActivityProductsBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setUpProductActions()
        super.onCreate(savedInstanceState)
    }

    override fun getBottomNavigation(): BottomNavigationView = binding.bottomNavigation

    private fun setUpProductActions() {
        binding.contentCoffees.root.setOnClickListener {

            //Exemplo navageção básica usando Intent e Extras

            val intent = Intent(this, CoffeeActivity::class.java)
                .putExtra("EXTRA_MESSAGE", "Venho da home")
            startActivity(intent)
        }

        binding.contentMachines.root.setOnClickListener {
            val intent = Intent(this, MachineActivity::class.java)
            startActivity(intent)
        }

        binding.contentAccessories.root.setOnClickListener {
            AlertDialog.Builder(this)
                .setMessage("Deu bom")
                .setTitle("Click Acessórios")
                .show()
        }
    }

}