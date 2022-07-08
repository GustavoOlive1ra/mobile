package br.com.cwi.pokemons.presentation.features.pokemons.viewHolder

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.databinding.ItemPokemonStatusBinding
import br.com.cwi.pokemons.domain.entity.Status

class PokemonStatusViewHolder(
    item: View
) :
    RecyclerView.ViewHolder(item) {
    val tvStatusName = ItemPokemonStatusBinding.bind(item).tvStatusName
    val tvStatusValue = ItemPokemonStatusBinding.bind(item).tvStatusValue

    fun bind(status: Status) {
        tvStatusName.text = status.name
        tvStatusValue.text = status.value.toString()
    }
}