package br.com.cwi.nespresso_app.presentation.feature.products.machine.viewholder

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.nespresso_app.databinding.ItemMachineBinding

class MachineViewHolder(item: View) : RecyclerView.ViewHolder(item) {
    val tvName = ItemMachineBinding.bind(item).tvMachineName
    val tvPrice = ItemMachineBinding.bind(item).tvMachinePrice
    val ivMachine = ItemMachineBinding.bind(item).ivMachinePhoto
}