package br.com.cwi.nespresso_app.presentation.products.coffee.viewholder

import android.content.Context
import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.ItemCoffeeCapsuleBinding
import br.com.cwi.nespresso_app.domain.entity.Coffee
import br.com.cwi.nespresso_app.presentation.extension.toMoneyFormat
import com.bumptech.glide.Glide

class CapsuleViewHolder(item: View) : RecyclerView.ViewHolder(item) {
    private val tvTitle = ItemCoffeeCapsuleBinding.bind(item).tvCapsuleTitle
    private val tvSubtitle = ItemCoffeeCapsuleBinding.bind(item).tvCapsuleSubtitle
    private val ivImage = ItemCoffeeCapsuleBinding.bind(item).ivCapsuleImage
    private val tvIntensity = ItemCoffeeCapsuleBinding.bind(item).tvCapsuleIntensity
    private val tvPrice = ItemCoffeeCapsuleBinding.bind(item).tvCapsulePrice
    private val ivFavorite = ItemCoffeeCapsuleBinding.bind(item).ivFavorite

    fun bind(context: Context, item: Coffee) {
        tvTitle.text = item.name
        tvSubtitle.text = item.description
        tvIntensity.text = context.getString(R.string.txt_intensity, item.intensity)
        tvPrice.text = item.unitPrice.toMoneyFormat()

        Glide.with(context)
            .load(item.urlImage)
            .into(ivImage)
    }
}