package br.com.cwi.nespresso_app.presentation.feature.favorites

import android.os.Bundle
import androidx.recyclerview.widget.DividerItemDecoration
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity
import br.com.cwi.nespresso_app.presentation.base.BaseBottomNavigation
import br.com.cwi.nespresso_app.databinding.ActivityFavoritesBinding
import br.com.cwi.nespresso_app.domain.entity.Type
import br.com.cwi.nespresso_app.presentation.extension.visibleOrGone
import br.com.cwi.nespresso_app.presentation.feature.products.coffee.CoffeeAdapter
import br.com.cwi.nespresso_app.presentation.feature.products.coffee.CoffeeViewModel
import com.google.android.material.bottomnavigation.BottomNavigationView
import org.koin.androidx.viewmodel.ext.android.viewModel

class FavoritesActivity : BaseBottomNavigation() {

    private lateinit var binding : ActivityFavoritesBinding

    override val currentTab: Int = R.id.favorites_menu

    private val viewModel : FavorityViewModel by viewModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityFavoritesBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setUpViewModel()
    }

    override fun getBottomNavigation(): BottomNavigationView = binding.contentBottomNavigation.root

    private fun setUpViewModel() {
        viewModel.favority.observe(this@FavoritesActivity) { list ->
            setUpFavorityRecyclerView(list)
        }

        viewModel.loading.observe(this@FavoritesActivity) { isLoading ->
            binding.viewLoading.root.visibleOrGone(isLoading)
        }

        viewModel.error.observe(this@FavoritesActivity) { hasError ->
            binding.viewError.root.visibleOrGone(hasError)
        }

        viewModel.fetchFavority()
    }

    private fun setUpFavorityRecyclerView(list: List<FavorityEntity>) {
        binding.rvFavoriteCaps.apply {
            addItemDecoration(
                DividerItemDecoration(this@FavoritesActivity, DividerItemDecoration.VERTICAL)
            )
            adapter = FavoriteAdapter(list)
        }
    }
}