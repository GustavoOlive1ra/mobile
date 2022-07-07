package br.com.cwi.pokemons.presentation.features.pokemons

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.domain.entity.Pokemons

class PokemonAdapter(
    private val list: List<Pokemons>,
    private val onPokemonClick: (String) -> Unit
) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_pokemon, parent, false)
        return  PokemonViewHolder(view, onPokemonClick)
    }

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, position: Int) {
        val item = list[position]
        (viewHolder as PokemonViewHolder).bind(item)
    }

    override fun getItemCount() = list.size
}