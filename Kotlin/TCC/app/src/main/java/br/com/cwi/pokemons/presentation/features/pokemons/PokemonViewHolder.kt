package br.com.cwi.pokemons.presentation.features.pokemons

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.databinding.ItemPokemonBinding
import br.com.cwi.pokemons.domain.entity.Pokemons
import com.bumptech.glide.Glide

class PokemonViewHolder(item: View, private val onPokemonClick: (String) -> Unit) :
    RecyclerView.ViewHolder(item) {
    val tvName = ItemPokemonBinding.bind(item).tvName
    val ivPokemon = ItemPokemonBinding.bind(item).ivPokemon

    fun bind(pokemon: Pokemons) {
        tvName.text = pokemon.name
        Glide.with(itemView.context).load(pokemon.image).into(ivPokemon)

        itemView.setOnClickListener{
            onPokemonClick(pokemon.name)
        }
    }
}