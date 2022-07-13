package br.com.cwi.pokemons.domain.entity

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
class PokemonDetail(
    val id: Int,
    val height: Int,
    val name: String,
    val weight: Int,
    val image: String,
    val status: List<Status>,
    val ability: List<Ability>,
    val type: List<Type>,
    var isFavorite: Boolean = false,
): Parcelable