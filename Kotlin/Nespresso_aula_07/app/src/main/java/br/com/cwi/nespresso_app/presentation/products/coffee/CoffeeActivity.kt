package br.com.cwi.nespresso_app.presentation.products.coffee

import android.os.Bundle
import androidx.recyclerview.widget.DividerItemDecoration
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.mapper.AcessoryMapper
import br.com.cwi.nespresso_app.data.mapper.CategoryMapper
import br.com.cwi.nespresso_app.data.mapper.MachineMapper
import br.com.cwi.nespresso_app.data.repository.CoffeeRepositoryImpl
import br.com.cwi.nespresso_app.databinding.ActivityCoffeeBinding
import br.com.cwi.nespresso_app.domain.entity.Type
import br.com.cwi.nespresso_app.domain.repository.CoffeeRepository
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class CoffeeActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityCoffeeBinding

    private val repository: CoffeeRepository =
        CoffeeRepositoryImpl(CategoryMapper(), MachineMapper(), AcessoryMapper())

    override val currentTab: Int = R.id.products_menu

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityCoffeeBinding.inflate(layoutInflater)
        setContentView(binding.root)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        setUpCapsList()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    override fun getBottomNavigation() = binding.bottomNavigation

    private fun setUpCapsList() {

        CoroutineScope(Dispatchers.Main).launch {
            repository.getCoffees().let { categoryList ->
                val recyclerView = binding.rvCaps

                recyclerView.addItemDecoration(
                    DividerItemDecoration(this@CoffeeActivity, DividerItemDecoration.VERTICAL)
                )

                val coffeeList = mutableListOf<Type>()

                categoryList.forEach {
                    coffeeList.add(it)
                    coffeeList.addAll(it.coffees)
                }

                recyclerView.adapter = CapsulesAdapter(this@CoffeeActivity, coffeeList)
            }
        }


    }
}