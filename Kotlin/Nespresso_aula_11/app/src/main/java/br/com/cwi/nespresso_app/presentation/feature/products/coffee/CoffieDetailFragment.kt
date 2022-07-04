package br.com.cwi.nespresso_app.presentation.feature.products.coffee

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.FragmentCoffieDetailBinding

const val KEY_ID_COFFEE = "KEI_ID_COFFEE"

class CoffieDetailFragment : Fragment() {

    private val coffeId by lazy {
        arguments?.get(KEY_ID_COFFEE) as? Int
    }

    private lateinit var binding: FragmentCoffieDetailBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentCoffieDetailBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.tvId.text = coffeId.toString()
    }
}