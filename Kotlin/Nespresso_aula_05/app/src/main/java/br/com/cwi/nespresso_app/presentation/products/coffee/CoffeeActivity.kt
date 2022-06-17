package br.com.cwi.nespresso_app.presentation.products.coffee

import android.os.Bundle
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.entity.CapsuleResponse
import br.com.cwi.nespresso_app.data.entity.CapsuleType
import br.com.cwi.nespresso_app.data.respository.CoffeeRepository
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigationActivity
import br.com.cwi.nespresso_app.databinding.ActivityCoffeeBinding
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.squareup.moshi.JsonAdapter
import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory

class CoffeeActivity : BaseBottomNavigationActivity() {

    private lateinit var binding: ActivityCoffeeBinding

    private val repository = CoffeeRepository(this)

    override val currentTab: Int = R.id.products_menu

    override fun getBottomNavigation(): BottomNavigationView =
        binding.contentBottomNavigation.bottomNavigation

    override fun onCreate(savedInstanceState: Bundle?) {
        binding = ActivityCoffeeBinding.inflate(layoutInflater)
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

        repository.getCapsule()?.capsules?.let { categoryList ->
            val capsuleTypeList : MutableList<CapsuleType> = mutableListOf()

            categoryList.forEach {
                capsuleTypeList.add(it)
                capsuleTypeList.addAll(it.coffees)
            }

            binding.rvCapsules.adapter = CapsulesAdapter(capsuleTypeList)
        }

    }

}