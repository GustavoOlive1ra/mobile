package br.com.cwi.pokemons.presentation.features.pokemons.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.domain.entity.Status
import br.com.cwi.pokemons.presentation.features.pokemons.viewHolder.PokemonStatusViewHolder
import br.com.cwi.pokemons.presentation.features.pokemons.viewHolder.PokemonViewHolder

class PokemonStatusAdapter(
    private val list: List<Status>
) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_pokemon_status, parent, false)
        return  PokemonStatusViewHolder(view)
    }

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, position: Int) {
        val item = list[position]
        (viewHolder as PokemonStatusViewHolder).bind(item)
    }

    override fun getItemCount() = list.size
}