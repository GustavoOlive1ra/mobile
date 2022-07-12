package br.com.cwi.pokemons.presentation.features.pokemons.viewHolder

import android.view.View
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.ItemPokemonTypeBinding
import br.com.cwi.pokemons.domain.entity.Type

class PokemonTypeViewHolder(
    item: View,
) :
    RecyclerView.ViewHolder(item) {
    val ivType = ItemPokemonTypeBinding.bind(item).ivType

    fun bind(type: Type) {
        val getResorces = when (type.name) {
            "normal" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_normal_type)
            "grass" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_grass_type)
            "poison" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_poison_type)
            "fire" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_fire_type)
            "flying" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_flying_type)
            "water" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_water_type)
            "bug" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_bug_type)
            "electric" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_electric_type)
            "ground" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_ground_type)
            "fairy" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_fairy_type)
            "fighting" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_fighting_type)
            "psychic" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_psychic_type)
            "steel" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_steel_type)
            "ice" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_dragon_type)
            "ghost" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_ghost_type)
            "rock" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_rock_type)
            "dragon" -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_dragon_type)
            else -> ContextCompat.getDrawable(itemView.context, R.drawable.ic_normal_type)
        }
        ivType.background = getResorces

    }
}