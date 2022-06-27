package br.com.cwi.nespresso_app.presentation.feature.favorites.coffee

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity
import br.com.cwi.nespresso_app.databinding.ItemFavoriteCoffeBinding
import br.com.cwi.nespresso_app.presentation.extension.toMoneyFormat
import com.bumptech.glide.Glide
const val TIPO = "MÁQUINAS"

class FavoriteCoffeViewHolder(
    itemView: View,
) : RecyclerView.ViewHolder(itemView) {

    private val tvTitle = ItemFavoriteCoffeBinding.bind(itemView).tvTitle
    private val tvSubtitle = ItemFavoriteCoffeBinding.bind(itemView).tvSubtitle
    private val ivImage = ItemFavoriteCoffeBinding.bind(itemView).ivImage
    private val tvPrice = ItemFavoriteCoffeBinding.bind(itemView).tvPrice


    fun bind(item: FavorityEntity) {

        tvTitle.text = item.name
        tvSubtitle.text = TIPO
        tvPrice.text = item.unitPrice.toMoneyFormat()

        Glide.with(itemView.context)
            .load(item.urlImage)
            .into(ivImage)
    }
}