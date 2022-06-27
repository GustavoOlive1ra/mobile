package br.com.cwi.nespresso_app.presentation.feature.products.viewholder

import android.view.View
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.ItemCoffeeBinding
import br.com.cwi.nespresso_app.domain.entity.Coffee
import br.com.cwi.nespresso_app.presentation.extension.toMoneyFormat
import com.bumptech.glide.Glide

class CoffeeViewHolder(
    itemView: View,
    private val onFavoriteClick: (Coffee) -> Unit
) : RecyclerView.ViewHolder(itemView) {
    private val tvTitle = ItemCoffeeBinding.bind(itemView).tvTitle
    private val tvSubtitle = ItemCoffeeBinding.bind(itemView).tvSubtitle
    private val ivImage = ItemCoffeeBinding.bind(itemView).ivImage
    private val tvIntensity = ItemCoffeeBinding.bind(itemView).tvIntensity
    private val tvPrice = ItemCoffeeBinding.bind(itemView).tvPrice
    private val ivFavorite = ItemCoffeeBinding.bind(itemView).ivFavorite

    fun bind(item: Coffee) {
        tvTitle.text = item.name
        tvSubtitle.text = item.description
        tvIntensity.text = itemView.context.getString(R.string.txt_intensity, item.intensity)
        tvPrice.text = item.unitPrice.toMoneyFormat()

        with(ivFavorite) {
            setImageDrawable(getFavoriteIcon(item))
            setOnClickListener {
                item.isFavorite = !item.isFavorite
                setImageDrawable(getFavoriteIcon(item))
                onFavoriteClick(item)
            }
        }

        Glide.with(itemView.context)
            .load(item.urlImage)
            .into(ivImage)
    }

    private fun getFavoriteIcon(coffee: Coffee) = ContextCompat.getDrawable(
        itemView.context,
        if (coffee.isFavorite) R.drawable.ic_favorite_filled
        else R.drawable.ic_favorite_rounded
    )
}