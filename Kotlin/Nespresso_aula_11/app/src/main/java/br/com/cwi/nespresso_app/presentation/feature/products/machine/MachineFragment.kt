package br.com.cwi.nespresso_app.presentation.feature.products.machine

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.GridLayoutManager
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.FragmentMachineBinding
import br.com.cwi.nespresso_app.domain.entity.Machine
import br.com.cwi.nespresso_app.presentation.feature.products.coffee.KEY_ID_COFFEE
import org.koin.androidx.viewmodel.ext.android.sharedViewModel

class MachineFragment: Fragment() {
    private lateinit var binding: FragmentMachineBinding

    private val viewModel : MachineViewModel by sharedViewModel()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentMachineBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {

        super.onViewCreated(view, savedInstanceState)
        setUpViewModel()
    }

    private fun setUpViewModel() {
        viewModel.machines.observe(viewLifecycleOwner) { list ->
            setUpMachineRecyclerView(list)
        }
    }

    private fun setUpMachineRecyclerView(list: List<Machine>) {
        binding.rvMachines.apply {
            layoutManager = GridLayoutManager(context, 2)
            addItemDecoration(
                DividerItemDecoration(context, DividerItemDecoration.VERTICAL)
            )
            adapter = MachineAdapter(
                list){viewModel.setFavorite(it)}
        }
    }
}