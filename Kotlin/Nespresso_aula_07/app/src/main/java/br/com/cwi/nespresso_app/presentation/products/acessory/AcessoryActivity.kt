package br.com.cwi.nespresso_app.presentation.products.acessory

import android.os.Bundle
import androidx.recyclerview.widget.DividerItemDecoration
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.mapper.AcessoryMapper
import br.com.cwi.nespresso_app.data.mapper.CategoryMapper
import br.com.cwi.nespresso_app.data.mapper.MachineMapper
import br.com.cwi.nespresso_app.data.repository.CoffeeRepositoryImpl
import br.com.cwi.nespresso_app.databinding.ActivityAcessoryBinding
import br.com.cwi.nespresso_app.domain.entity.Type
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class AcessoryActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityAcessoryBinding

    private val repository =
    CoffeeRepositoryImpl(CategoryMapper(), MachineMapper(), AcessoryMapper())

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

                val newAcessorysList = mutableListOf<Type>()

                acessoryList.forEach {
                    newAcessorysList.add(it)
                    newAcessorysList.addAll(it.itens)
                }

                recyclerView.adapter = AcessoryAdapter(this@AcessoryActivity, newAcessorysList)
            }
        }


    }
}