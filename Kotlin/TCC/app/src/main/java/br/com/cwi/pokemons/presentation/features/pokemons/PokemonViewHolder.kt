package br.com.cwi.pokemons.presentation.features.pokemons

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.databinding.ItemPokemonBinding
import br.com.cwi.pokemons.domain.entity.Pokemons
import com.bumptech.glide.Glide

class PokemonViewHolder(item: View) : RecyclerView.ViewHolder(item) {
    val tvName = ItemPokemonBinding.bind(item).tvName
    val ivPokemon = ItemPokemonBinding.bind(item).ivPokemon

    fun bind(item: Pokemons) {
        tvName.text = item.name
        Glide.with(itemView.context).load(item.image).into(ivPokemon)
    }
}