package br.com.cwi.nespresso_app.presentation.feature.products.machine.viewholder

import android.view.View
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.R
import br.com.cwi.nespresso_app.databinding.ItemMachineBinding
import br.com.cwi.nespresso_app.domain.entity.Coffee
import br.com.cwi.nespresso_app.domain.entity.Machine
import br.com.cwi.nespresso_app.presentation.extension.toMoneyFormat
import com.bumptech.glide.Glide

class MachineViewHolder(item: View, private val onFavoriteClick: (Machine) -> Unit) : RecyclerView.ViewHolder(item) {
    val tvName = ItemMachineBinding.bind(item).tvMachineName
    val tvPrice = ItemMachineBinding.bind(item).tvMachinePrice
    val ivMachine = ItemMachineBinding.bind(item).ivMachinePhoto
    val ivFavorite = ItemMachineBinding.bind(item).ivFavorite

    fun bind(item: Machine){
        tvName.text = item.name
        tvPrice.text = item.unitPrice.toMoneyFormat(0)

        Glide.with(itemView.context).load(item.urlImage).into(ivMachine)

        with(ivFavorite) {
            setImageDrawable(getFavoriteIcon(item))
            setOnClickListener {
                item.isFavorite = !item.isFavorite
                setImageDrawable(getFavoriteIcon(item))
                onFavoriteClick(item)
            }
        }
    }


    private fun getFavoriteIcon(machine: Machine) = ContextCompat.getDrawable(
        itemView.context,
        if (machine.isFavorite) R.drawable.ic_favorite_filled
        else R.drawable.ic_favorite_rounded
    )
}