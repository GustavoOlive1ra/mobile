package br.com.cwi.nespresso_app.presentation.feature.products.machine

import android.os.Bundle
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.fragment.findNavController
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.ActivityMachineHostBinding
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import br.com.cwi.nespresso_app.presentation.extension.visibleOrGone
import com.google.android.material.bottomnavigation.BottomNavigationView
import org.koin.androidx.viewmodel.ext.android.viewModel

class MachineHostActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityMachineHostBinding

    private val viewModel: MachineViewModel by viewModel()

    override val currentTab: Int = R.id.products_menu

    private val navController by lazy{
        (supportFragmentManager.findFragmentById(binding.navHostContainner.id) as NavHostFragment).findNavController()
    }

    override fun getBottomNavigation(): BottomNavigationView = binding.contentBottomNavigation.root

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMachineHostBinding.inflate(layoutInflater)

        setContentView(binding.root)
        setUpViewModel()

    }


    private fun setUpViewModel() {
        viewModel.loading.observe(this@MachineHostActivity) { isLoading ->
            binding.viewLoading.root.visibleOrGone(isLoading)
        }

        viewModel.error.observe(this@MachineHostActivity) { hasError ->
            binding.viewError.root.visibleOrGone(hasError)
        }
        viewModel.fetchMachines()
    }
}