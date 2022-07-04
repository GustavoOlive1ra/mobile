package br.com.cwi.nespresso_app.presentation.feature.favorites

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity

import br.com.cwi.nespresso_app.presentation.feature.favorites.coffee.FavoriteCoffeViewHolder

class FavoriteAdapter(
    private val list: List<FavorityEntity>,
) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        val view = inflateView(R.layout.item_favorite_coffe, parent)
        return  FavoriteCoffeViewHolder(view)

    }

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, position: Int) {
        val item = list[position]
        (viewHolder as FavoriteCoffeViewHolder).bind(item)
    }

    override fun getItemCount() = list.size

    override fun getItemViewType(position: Int) = list[position].type.value

    private fun inflateView(layout: Int, parent: ViewGroup) = LayoutInflater.from(parent.context)
        .inflate(layout, parent, false)
}