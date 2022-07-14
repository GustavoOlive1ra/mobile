package br.com.cwi.pokemons.presentation.features.pokemons.viewHolder

import android.graphics.Color
import android.view.View
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.ItemPokemonBinding
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.presentation.extension.visibleOrGone
import com.bumptech.glide.Glide

private const val UNLOCKED_TEXT = "???"


class PokemonViewHolder(
    item: View,
    private val onPokemonClick: (String) -> Unit
) :
    RecyclerView.ViewHolder(item) {
    val tvName = ItemPokemonBinding.bind(item).tvName
    val ivPokemon = ItemPokemonBinding.bind(item).ivPokemon
    val ivFavorite = ItemPokemonBinding.bind(item).ivFavorite
    val clPokemon = ItemPokemonBinding.bind(item).clPokemon

    fun bind(pokemon: Pokemons) {
        Glide.with(itemView.context).load(pokemon.image).into(ivPokemon)
        if(pokemon.unlocked){
            tvName.text = pokemon.name.uppercase()
            tvName.setTextColor(ContextCompat.getColor(itemView.context ,R.color.black))
            ivPokemon.setColorFilter(null)
            with(clPokemon){
                setBackgroundColor(ContextCompat.getColor(itemView.context ,R.color.white))
            }
            
        }else{
            with(tvName) {
                text = UNLOCKED_TEXT
                setTextColor(ContextCompat.getColor(itemView.context ,R.color.white))
            }
            ivPokemon.setColorFilter(Color.argb(255, 0, 0, 0))
            with(clPokemon){
                setBackgroundColor(ContextCompat.getColor(itemView.context ,R.color.card_blue))
            }
        }


        ivFavorite.visibleOrGone(pokemon.favorite)
        itemView.setOnClickListener {
            onPokemonClick(pokemon.name)
        }
    }
}