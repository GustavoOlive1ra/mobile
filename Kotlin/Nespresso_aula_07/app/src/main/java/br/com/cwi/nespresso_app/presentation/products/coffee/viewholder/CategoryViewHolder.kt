package br.com.cwi.nespresso_app.presentation.products.coffee.viewholder

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.databinding.ItemCapCategoryBinding
import br.com.cwi.nespresso_app.domain.entity.Category

class CategoryViewHolder(item: View) : RecyclerView.ViewHolder(item) {
    private val tvCategory = ItemCapCategoryBinding.bind(item).tvCapTitleCategory

    fun bind(item: Category) {
        tvCategory.text = item.category
    }
}