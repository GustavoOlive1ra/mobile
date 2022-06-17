package br.com.cwi.nespresso_app.presentation.products.coffee

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.ViewHolder
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.base.toMoneyFormat
import br.com.cwi.nespresso_app.data.entity.CapsuleType
import br.com.cwi.nespresso_app.data.entity.CategoryResponse
import br.com.cwi.nespresso_app.data.entity.CoffeeResponse
import br.com.cwi.nespresso_app.databinding.ItemCategoryBinding
import br.com.cwi.nespresso_app.databinding.ItemCoffeBinding

private const val VIEW_TYPE_CATEGORY = 0

class CapsulesAdapter(private val list: List<CapsuleType>) : RecyclerView.Adapter<ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {

        return if (viewType == VIEW_TYPE_CATEGORY) {
            CategoryViewHolder(inflateView(R.layout.item_category, parent))
        } else {
            CoffeeViewHolder(inflateView(R.layout.item_coffe, parent))
        }
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val item = list[position]

        if (item.type == VIEW_TYPE_CATEGORY) {
            (holder as CategoryViewHolder).tvCategory.text = (item as CategoryResponse).category
        } else {
            (holder as CoffeeViewHolder).bind(item as CoffeeResponse)
        }
    }

    override fun getItemCount() = list.size

    override fun getItemViewType(position: Int) = list[position].type

    private fun inflateView(layout: Int, parent: ViewGroup) = LayoutInflater
        .from(parent.context)
        .inflate(layout, parent, false)
}

class CategoryViewHolder(item: View) : ViewHolder(item) {
    val tvCategory = ItemCategoryBinding.bind(item).tvCategory
}

class CoffeeViewHolder(item: View) : ViewHolder(item) {
    private val tvTitle = ItemCoffeBinding.bind(item).tvCapsuleTitle
    private val tvSubtitle = ItemCoffeBinding.bind(item).tvCapsuleSubtitle
    private val ivImage = ItemCoffeBinding.bind(item).ivCapsuleImage
    private val tvIntensity = ItemCoffeBinding.bind(item).tvCapsuleIntensity
    private val tvPrice = ItemCoffeBinding.bind(item).tvCapsulePrice
    private val ivFavorite = ItemCoffeBinding.bind(item).ivFavorite

    fun bind(item: CoffeeResponse) {
        tvTitle.text = item.name
        tvSubtitle.text = item.description
        //ivImage.text = item.
        tvIntensity.text = "Intensidade: ${item.intensity.toString()}"
        tvPrice.text = item.unitPrice.toMoneyFormat()
    }
}
