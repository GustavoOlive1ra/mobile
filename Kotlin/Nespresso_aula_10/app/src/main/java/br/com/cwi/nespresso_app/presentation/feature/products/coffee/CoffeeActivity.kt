package br.com.cwi.nespresso_app.presentation.feature.products.coffee

import android.os.Bundle
import androidx.recyclerview.widget.DividerItemDecoration
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.ActivityCoffeeBinding
import br.com.cwi.nespresso_app.domain.entity.Type
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import br.com.cwi.nespresso_app.presentation.extension.visibleOrGone
import com.google.android.material.bottomnavigation.BottomNavigationView
import org.koin.androidx.viewmodel.ext.android.viewModel
import java.util.*

class CoffeeActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityCoffeeBinding

    private val viewModel : CoffeeViewModel by viewModel()

    override val currentTab: Int = R.id.products_menu

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityCoffeeBinding.inflate(layoutInflater)
        setContentView(binding.root)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        setUpViewModel()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    override fun getBottomNavigation(): BottomNavigationView = binding.contentBottomNavigation.root

    private fun setUpViewModel() {
        viewModel.coffees.observe(this@CoffeeActivity) { list ->
            setUpCoffeeRecyclerView(list)
        }

        viewModel.loading.observe(this@CoffeeActivity) { isLoading ->
            binding.viewLoading.root.visibleOrGone(isLoading)
        }

        viewModel.error.observe(this@CoffeeActivity) { hasError ->
            binding.viewError.root.visibleOrGone(hasError)
        }

        viewModel.fetchCoffees()
    }

    private fun setUpCoffeeRecyclerView(list: List<Type>) {
        binding.rvCaps.apply {
            addItemDecoration(
                DividerItemDecoration(this@CoffeeActivity, DividerItemDecoration.VERTICAL)
            )
            adapter = CoffeeAdapter(list) {
                viewModel.setFavorite(it)
            }
        }
    }
}