package br.com.cwi.nespresso_app.presentation.feature.products.viewholder

import android.view.View
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.ItemAccessoryBinding
import br.com.cwi.nespresso_app.domain.entity.Accessory
import br.com.cwi.nespresso_app.presentation.extension.toMoneyFormat
import com.bumptech.glide.Glide

class AccessoryViewHolder(itemView: View, private val onFavoriteClick: (Accessory) -> Unit) :
    RecyclerView.ViewHolder(itemView) {
    private val tvTitle = ItemAccessoryBinding.bind(itemView).tvTitle
    private val ivImage = ItemAccessoryBinding.bind(itemView).ivImage
    private val tvPrice = ItemAccessoryBinding.bind(itemView).tvPrice
    private val ivFavorite = ItemAccessoryBinding.bind(itemView).ivFavorite

    fun bind(item: Accessory) {
        tvTitle.text = item.name
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

    private fun getFavoriteIcon(accessory: Accessory) = ContextCompat.getDrawable(
        itemView.context,
        if (accessory.isFavorite) R.drawable.ic_favorite_filled
        else R.drawable.ic_favorite_rounded
    )
}