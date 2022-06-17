package br.com.cwi.nespresso_app.presentation.products.acessory

import android.os.Bundle
import androidx.recyclerview.widget.DividerItemDecoration
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.entity.AcessoryType
import br.com.cwi.nespresso_app.data.entity.CapsuleType
import br.com.cwi.nespresso_app.data.repository.CoffeeRepository
import br.com.cwi.nespresso_app.databinding.ActivityAcessoryBinding
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import br.com.cwi.nespresso_app.presentation.products.coffee.CapsulesAdapter
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class AcessoryActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityAcessoryBinding

    private val repository = CoffeeRepository()

    override val currentTab: Int = R.id.products_menu

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAcessoryBinding.inflate(layoutInflater)
        setContentView(binding.root)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        setUpAcessoriesList()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    override fun getBottomNavigation() = binding.bottomNavigation

    private fun setUpAcessoriesList() {

        CoroutineScope(Dispatchers.Main).launch {
            repository.getAcessories().let { acessoryList ->
                val recyclerView = binding.rvAcessories

                recyclerView.addItemDecoration(
                    DividerItemDecoration(this@AcessoryActivity, DividerItemDecoration.VERTICAL)
                )

                val newAcessorysList = mutableListOf<AcessoryType>()

                acessoryList.forEach {
                    newAcessorysList.add(it)
                    newAcessorysList.addAll(it.itens)
                }

                recyclerView.adapter = AcessoryAdapter(this@AcessoryActivity, newAcessorysList)
            }
        }


    }
}