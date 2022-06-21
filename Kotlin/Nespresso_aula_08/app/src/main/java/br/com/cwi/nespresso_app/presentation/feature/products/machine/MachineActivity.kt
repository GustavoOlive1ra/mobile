package br.com.cwi.nespresso_app.presentation.feature.products.machine

import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.mapper.CategoryAccessoryMapper
import br.com.cwi.nespresso_app.data.mapper.CategoryCoffeeMapper
import br.com.cwi.nespresso_app.data.mapper.MachineMapper
import br.com.cwi.nespresso_app.data.repository.CoffeeRepositoryImpl
import br.com.cwi.nespresso_app.databinding.ActivityMachineBinding
import br.com.cwi.nespresso_app.domain.entity.Machine
import br.com.cwi.nespresso_app.domain.repository.CoffeeRepository
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import br.com.cwi.nespresso_app.presentation.extension.visibleOrGone
import br.com.cwi.nespresso_app.presentation.feature.products.coffee.CoffeeViewModel
import com.google.android.material.bottomnavigation.BottomNavigationView
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class MachineActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityMachineBinding

    private val viewModel = MachineViewModel()



    override val currentTab: Int = R.id.products_menu

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMachineBinding.inflate(layoutInflater)
        setContentView(binding.root)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        setUpViewModel()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    override fun getBottomNavigation(): BottomNavigationView = binding.contentBottomNavigation.root

    private fun setUpViewModel(){
        viewModel.machine.observe(this@MachineActivity) { list ->
            setUpMachineList(list)
        }

        viewModel.loading.observe(this@MachineActivity) { isLoading ->
            binding.viewLoading.root.visibleOrGone(isLoading)
        }

        viewModel.error.observe(this@MachineActivity) { hasError ->
            binding.viewError.root.visibleOrGone(hasError)
        }

        viewModel.fetchMachine()
    }

    private fun setUpMachineList(list: List<Machine>) {
        binding.rvMachines.layoutManager = GridLayoutManager(this@MachineActivity, 2)
        binding.rvMachines.adapter = MachineAdapter(context = this@MachineActivity, list)
    }
}