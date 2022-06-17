package br.com.cwi.nespresso_app.presentation.products.machine

import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.repository.CoffeeRepository
import br.com.cwi.nespresso_app.databinding.ActivityMachineBinding
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class MachineActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityMachineBinding

    private val repository = CoffeeRepository()

    override val currentTab: Int = R.id.products_menu

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMachineBinding.inflate(layoutInflater)
        setContentView(binding.root)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        setUpMachineList()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    override fun getBottomNavigation() = binding.bottomNavigation

    private fun setUpMachineList() {

        CoroutineScope(Dispatchers.Main).launch {

            repository.getMachines().let {
                val recyclerView = binding.rvMachines
                recyclerView.adapter = MachineAdapter(context = this@MachineActivity, it)
                recyclerView.layoutManager = GridLayoutManager(this@MachineActivity, 2)
            }
        }
    }
}