package br.com.cwi.pokemons.presentation.features.pokemons.viewHolder

import android.view.View
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.ItemPokemonBinding
import br.com.cwi.pokemons.domain.entity.Pokemons
import com.bumptech.glide.Glide
private const val UNLOCKED_TEXT = "???"


class PokemonViewHolder(
    item: View,
    private val onPokemonClick: (String) -> Unit
) :
    RecyclerView.ViewHolder(item) {
    val tvName = ItemPokemonBinding.bind(item).tvName
    val ivPokemon = ItemPokemonBinding.bind(item).ivPokemon

    fun bind(pokemon: Pokemons) {
        if(pokemon.unlocked){
            tvName.text = pokemon.name.uppercase()
            Glide.with(itemView.context).load(pokemon.image).into(ivPokemon)
        }else{
            tvName.text = UNLOCKED_TEXT
            with(ivPokemon) {
                setImageDrawable(ContextCompat.getDrawable(context, R.drawable.pokebola))
            }
            Glide.with(itemView.context).load(pokemon.image).into(ivPokemon)
        }
        itemView.setOnClickListener {
            onPokemonClick(pokemon.name)
        }
    }
}