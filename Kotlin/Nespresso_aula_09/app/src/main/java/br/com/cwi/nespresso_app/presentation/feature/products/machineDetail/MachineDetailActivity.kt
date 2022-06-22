package br.com.cwi.nespresso_app.presentation.feature.products.machineDetail

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.ActivityMachineBinding
import br.com.cwi.nespresso_app.databinding.ActivityMachineDetailBinding
import br.com.cwi.nespresso_app.domain.entity.Machine
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import br.com.cwi.nespresso_app.presentation.extension.toMoneyFormat
import br.com.cwi.nespresso_app.presentation.extension.visibleOrGone
import br.com.cwi.nespresso_app.presentation.feature.products.machine.MachineAdapter
import br.com.cwi.nespresso_app.presentation.feature.products.machine.MachineViewModel
import com.bumptech.glide.Glide
import com.google.android.material.bottomnavigation.BottomNavigationView
import org.koin.androidx.viewmodel.ext.android.viewModel
const val KEY_ID_MACHINE = "id"
const val VALUE_DEFAULT = -1
class MachineDetailActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMachineDetailBinding

    private val viewModel: MachineDetailViewModel by viewModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        binding = ActivityMachineDetailBinding.inflate(layoutInflater)
        setContentView(binding.root)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
        super.onCreate(savedInstanceState)
        setUpViewModel(intent.getIntExtra(KEY_ID_MACHINE, VALUE_DEFAULT))
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    private fun setUpViewModel(id: Int) {
        viewModel.machine.observe(this@MachineDetailActivity) { machine ->
            setUpView(machine)
        }

        viewModel.loading.observe(this@MachineDetailActivity) { isLoading ->
            binding.viewLoading.root.visibleOrGone(isLoading)
        }

        viewModel.error.observe(this@MachineDetailActivity) { hasError ->
            binding.viewError.root.visibleOrGone(hasError)
        }

        viewModel.fetchMachineDetail(id)
    }

    private fun setUpView(machine: Machine) {
        binding.tvTitulo.text= machine.name
        binding.tvPreco.text = machine.unitPrice.toMoneyFormat()
        binding.tvDescricao.text = machine.description
        Glide.with(this@MachineDetailActivity).load(machine.imageUrl).into(binding.ivImageMachine)
    }
}