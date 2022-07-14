package br.com.cwi.pokemons.presentation.features.battle.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.domain.entity.BattleLog
import br.com.cwi.pokemons.presentation.features.battle.viewHolder.BattleLogViewHolder

class BattleAdapter(
    private val list: List<BattleLog>,
) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_battle_log, parent, false)
        return BattleLogViewHolder(view)
    }

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, position: Int) {
        val item = list[position]
        (viewHolder as BattleLogViewHolder).bind(item)
    }

    override fun getItemCount() = list.size
}