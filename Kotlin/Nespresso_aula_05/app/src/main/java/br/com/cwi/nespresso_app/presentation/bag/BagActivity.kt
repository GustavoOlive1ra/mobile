package br.com.cwi.nespresso_app.presentation.bag

import android.os.Bundle
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigationActivity
import br.com.cwi.nespresso_app.databinding.ActivityBagBinding
import com.google.android.material.bottomnavigation.BottomNavigationView

class BagActivity : BaseBottomNavigationActivity() {

    private lateinit var binding : ActivityBagBinding

    override fun getBottomNavigation(): BottomNavigationView = binding.bottomNavigation

    override fun onCreate(savedInstanceState: Bundle?) {
        binding = ActivityBagBinding.inflate(layoutInflater)
        setContentView(binding.root)
        super.onCreate(savedInstanceState)
    }

    override val currentTab: Int = R.id.bag_menu

}