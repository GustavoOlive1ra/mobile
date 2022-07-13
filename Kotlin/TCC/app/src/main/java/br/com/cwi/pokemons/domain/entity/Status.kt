package br.com.cwi.pokemons.domain.entity

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
class Status (
    val value: Int,
    val name: String
    ): Parcelable