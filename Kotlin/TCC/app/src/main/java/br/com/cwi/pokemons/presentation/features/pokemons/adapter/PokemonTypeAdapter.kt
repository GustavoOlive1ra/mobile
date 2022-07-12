package br.com.cwi.pokemons.presentation.features.pokemons.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.domain.entity.Type
import br.com.cwi.pokemons.presentation.features.pokemons.viewHolder.PokemonTypeViewHolder

class PokemonTypeAdapter(
    private val list: List<Type>,
) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_pokemon_type, parent, false)
        return PokemonTypeViewHolder(view)
    }

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, position: Int) {
        val item = list[position]
        (viewHolder as PokemonTypeViewHolder).bind(item)
    }

    override fun getItemCount() = list.size
}