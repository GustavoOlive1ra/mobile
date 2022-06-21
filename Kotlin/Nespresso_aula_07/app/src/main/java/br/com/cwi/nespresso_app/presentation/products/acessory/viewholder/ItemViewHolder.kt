package br.com.cwi.nespresso_app.presentation.products.acessory.viewholder

import android.content.Context
import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.databinding.ItemAcessoryItemBinding
import br.com.cwi.nespresso_app.domain.entity.Item
import br.com.cwi.nespresso_app.presentation.extension.toMoneyFormat
import com.bumptech.glide.Glide

class ItemViewHolder(item: View) : RecyclerView.ViewHolder(item) {
    private val tvTitle = ItemAcessoryItemBinding.bind(item).tvAcessoryTitle
    private val ivImage = ItemAcessoryItemBinding.bind(item).ivAcessoryImage
    private val tvPrice = ItemAcessoryItemBinding.bind(item).tvAcessoryPrice
    private val ivFavorite = ItemAcessoryItemBinding.bind(item).ivFavorite

    fun bind(context: Context, item: Item) {
        tvTitle.text = item.name
        tvPrice.text = item.unitPrice.toMoneyFormat()

        Glide.with(context)
            .load(item.urlImage)
            .into(ivImage)
    }
}