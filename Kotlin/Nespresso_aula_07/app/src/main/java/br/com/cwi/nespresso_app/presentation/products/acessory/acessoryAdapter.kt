package br.com.cwi.nespresso_app.presentation.products.acessory

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.ViewHolder
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.data.entity.AcessoryResponse
import br.com.cwi.nespresso_app.data.entity.ItemResponse
import br.com.cwi.nespresso_app.databinding.ItemAcessoryCategoryBinding
import br.com.cwi.nespresso_app.databinding.ItemAcessoryItemBinding
import br.com.cwi.nespresso_app.domain.entity.Acessory
import br.com.cwi.nespresso_app.domain.entity.Item
import br.com.cwi.nespresso_app.domain.entity.ItemType
import br.com.cwi.nespresso_app.domain.entity.Type
import br.com.cwi.nespresso_app.presentation.extension.toMoneyFormat
import br.com.cwi.nespresso_app.presentation.products.acessory.viewholder.CategoryViewHolder
import br.com.cwi.nespresso_app.presentation.products.acessory.viewholder.ItemViewHolder
import com.bumptech.glide.Glide

const val VIEW_TYPE_CATEGORY = 0

class AcessoryAdapter(val context: Context, private val list: List<Type>) : RecyclerView.Adapter<ViewHolder>() {

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

        if (item.type == ItemType.CATEGORY) {

            item as Acessory
            (viewHolder as CategoryViewHolder).bind(item)

        } else {

            item as Item
            (viewHolder as ItemViewHolder).bind(context, item)

        }
    }

    override fun getItemCount() = list.size

    override fun getItemViewType(position: Int) = list[position].type.value

    private fun inflateView(layout: Int, parent: ViewGroup) = LayoutInflater.from(parent.context)
        .inflate(layout, parent, false)
}



