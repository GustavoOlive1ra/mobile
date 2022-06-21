package br.com.cwi.nespresso_app.presentation.products.acessory.viewholder

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.databinding.ItemAcessoryCategoryBinding
import br.com.cwi.nespresso_app.domain.entity.Acessory

class CategoryViewHolder(item: View) : RecyclerView.ViewHolder(item) {
    private val tvCategory = ItemAcessoryCategoryBinding.bind(item).tvCategoryType

    fun bind(item: Acessory) {
        tvCategory.text = item.category
    }
}