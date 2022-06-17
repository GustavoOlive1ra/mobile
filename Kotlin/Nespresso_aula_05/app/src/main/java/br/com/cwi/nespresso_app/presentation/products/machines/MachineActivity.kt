package br.com.cwi.nespresso_app.presentation.products.machines

import android.R
import android.os.Bundle
import android.view.View
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.data.respository.CoffeeRepository
import br.com.cwi.nespresso_app.databinding.ActivityMachineBinding
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigationActivity
import com.google.android.material.bottomnavigation.BottomNavigationView


class MachineActivity : BaseBottomNavigationActivity() {

    private lateinit var binding: ActivityMachineBinding

    private val repository = CoffeeRepository(this)

    override val currentTab: Int = br.com.cwi.nespresso_app.R.id.products_menu

    override fun getBottomNavigation(): BottomNavigationView =
        binding.contentBottomNavigation.bottomNavigation

    override fun onCreate(savedInstanceState: Bundle?) {
        binding = ActivityMachineBinding.inflate(layoutInflater)
        setContentView(binding.root)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
        super.onCreate(savedInstanceState)

        setUpCapsuleList()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    private fun setUpCapsuleList() {
        binding.rvMachines.layoutManager = GridLayoutManager(this, 2)
        repository.getMachines()?.machines?.let { machineList ->
            binding.rvMachines.adapter = MachinesAdapter(machineList)
        }
    }
}