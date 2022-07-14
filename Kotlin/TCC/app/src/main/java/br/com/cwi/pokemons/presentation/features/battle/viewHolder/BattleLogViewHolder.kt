package br.com.cwi.pokemons.presentation.features.battle.viewHolder

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import br.com.cwi.pokemons.databinding.ItemBattleLogBinding
import br.com.cwi.pokemons.domain.entity.BattleLog

class BattleLogViewHolder(
    item: View,
) :
    RecyclerView.ViewHolder(item) {
    val tvAction = ItemBattleLogBinding.bind(item).tvAction

    fun bind(battleLog: BattleLog) {
        tvAction.text =
            "${battleLog.pokemonAttackName.uppercase()}: Damage ${battleLog.damageCauseAttack}, ${battleLog.pokemonDefenseName.uppercase()}: live ${battleLog.lifeRemainDefense}"
    }
}