package br.com.cwi.nespresso_app.presentation.products.acessory

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.ViewHolder
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.entity.AcessoryResponse
import br.com.cwi.nespresso_app.data.entity.AcessoryType
import br.com.cwi.nespresso_app.data.entity.ItemResponse
import br.com.cwi.nespresso_app.databinding.ItemAcessoryCategoryBinding
import br.com.cwi.nespresso_app.databinding.ItemAcessoryItemBinding
import br.com.cwi.nespresso_app.presentation.extension.toMoneyFormat
import com.bumptech.glide.Glide

const val VIEW_TYPE_CATEGORY = 0

class AcessoryAdapter(val context: Context, private val list: List<AcessoryType>) : RecyclerView.Adapter<ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        return if (viewType == VIEW_TYPE_CATEGORY) {

            val view = inflateView(R.layout.item_acessory_category, parent)
            CategoryViewHolder(view)

        } else {

            val view = inflateView(R.layout.item_acessory_item, parent)
            ItemViewHolder(view)

        }
    }

    override fun onBindViewHolder(viewHolder: ViewHolder, position: Int) {
        val item = list[position]

        if (item.type == VIEW_TYPE_CATEGORY) {

            item as AcessoryResponse
            (viewHolder as CategoryViewHolder).bind(item)

        } else {

            item as ItemResponse
            (viewHolder as ItemViewHolder).bind(context, item)

        }
    }

    override fun getItemCount() = list.size

    override fun getItemViewType(position: Int) = list[position].type

    private fun inflateView(layout: Int, parent: ViewGroup) = LayoutInflater.from(parent.context)
        .inflate(layout, parent, false)
}

class CategoryViewHolder(item: View) : RecyclerView.ViewHolder(item) {
    private val tvCategory = ItemAcessoryCategoryBinding.bind(item).tvCategoryType

    fun bind(item: AcessoryResponse) {
        tvCategory.text = item.category
    }
}

class ItemViewHolder(item: View) : RecyclerView.ViewHolder(item) {
    private val tvTitle = ItemAcessoryItemBinding.bind(item).tvAcessoryTitle
    private val ivImage = ItemAcessoryItemBinding.bind(item).ivAcessoryImage
    private val tvPrice = ItemAcessoryItemBinding.bind(item).tvAcessoryPrice
    private val ivFavorite = ItemAcessoryItemBinding.bind(item).ivFavorite

    fun bind(context: Context, item: ItemResponse) {
        tvTitle.text = item.name
        tvPrice.text = item.price.toMoneyFormat()

        Glide.with(context)
            .load(item.urlImage)
            .into(ivImage)
    }
}