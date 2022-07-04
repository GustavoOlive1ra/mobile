package br.com.cwi.nespresso_app.presentation.feature.products.coffee

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.fragment.findNavController
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.ActivityCoffeeHostBinding
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import br.com.cwi.nespresso_app.presentation.extension.visibleOrGone
import com.google.android.material.bottomnavigation.BottomNavigationView
import org.koin.androidx.viewmodel.ext.android.viewModel


class CoffeeHostActivity : BaseBottomNavigation() {

    private val viewModel : CoffeeViewModel by viewModel()

    private lateinit var binding: ActivityCoffeeHostBinding

    private val navController by lazy{
        (supportFragmentManager.findFragmentById(binding.navHostContainner.id) as NavHostFragment).findNavController()
    }

    override val currentTab: Int = R.id.products_menu

    override fun getBottomNavigation(): BottomNavigationView = binding.contentBottomNavigation.root


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityCoffeeHostBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setUpViewModel()
    }


    private fun setUpViewModel() {
        viewModel.loading.observe(this) { isLoading ->
            binding.viewLoading.root.visibleOrGone(isLoading)
        }

        viewModel.error.observe(this) { hasError ->
            binding.viewError.root.visibleOrGone(hasError)
        }
        viewModel.fetchCoffees()
    }
}