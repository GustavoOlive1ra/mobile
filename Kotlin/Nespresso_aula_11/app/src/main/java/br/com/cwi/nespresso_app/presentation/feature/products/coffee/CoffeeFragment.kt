package br.com.cwi.nespresso_app.presentation.feature.products.coffee

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.DividerItemDecoration
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.FragmentCoffeeBinding
import br.com.cwi.nespresso_app.domain.entity.Type
import br.com.cwi.nespresso_app.presentation.extension.visibleOrGone
import org.koin.androidx.viewmodel.ext.android.sharedViewModel

class CoffeeFragment: Fragment() {
    private lateinit var binding: FragmentCoffeeBinding

    private val viewModel : CoffeeViewModel by sharedViewModel()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentCoffeeBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {

        super.onViewCreated(view, savedInstanceState)
        setUpViewModel()
    }

    private fun setUpViewModel() {
        viewModel.coffees.observe(viewLifecycleOwner) { list ->
            setUpCoffeeRecyclerView(list)
        }
    }

    private fun setUpCoffeeRecyclerView(list: List<Type>) {
        binding.rvCaps.apply {
            addItemDecoration(
                DividerItemDecoration(context, DividerItemDecoration.VERTICAL)
            )
            adapter = CoffeeAdapter(
                list,{viewModel.setFavorite(it)},{navitagionToCoffeeDatail(it)} )
        }
    }

    private fun navitagionToCoffeeDatail(id: Int){
        findNavController().navigate(R.id.action_coffeeFragment_to_coffieDetailFragment, bundleOf(
            Pair(KEY_ID_COFFEE, id)
        ))
    }
}