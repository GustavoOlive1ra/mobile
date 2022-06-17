package br.com.cwi.nespresso_app.presentation.products.machines

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.base.toMoneyFormat
import br.com.cwi.nespresso_app.data.entity.*
import br.com.cwi.nespresso_app.databinding.ItemCategoryBinding
import br.com.cwi.nespresso_app.databinding.ItemCoffeBinding
import br.com.cwi.nespresso_app.databinding.ItemMachineBinding

class MachinesAdapter(private val list: List<MachineTypeResponse>) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {

        return MachineViewHolder(inflateView(R.layout.item_machine, parent))
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        val item = list[position]
        (holder as MachineViewHolder).bind(item)
    }

    override fun getItemCount() = list.size

    private fun inflateView(layout: Int, parent: ViewGroup) = LayoutInflater
        .from(parent.context)
        .inflate(layout, parent, false)
}

class MachineViewHolder(item: View) : RecyclerView.ViewHolder(item) {
    private val tvTitle = ItemMachineBinding.bind(item).tvCapsuleTitle
    private val ivImage = ItemMachineBinding.bind(item).ivCapsuleImage
    private val tvPrice = ItemMachineBinding.bind(item).tvCapsulePrice
    private val ivFavorite = ItemMachineBinding.bind(item).ivFavorite

    fun bind(item: MachineTypeResponse) {
        tvTitle.text = item.name
        //ivImage.text = item.
        tvPrice.text = item.price.toMoneyFormat()
    }
}