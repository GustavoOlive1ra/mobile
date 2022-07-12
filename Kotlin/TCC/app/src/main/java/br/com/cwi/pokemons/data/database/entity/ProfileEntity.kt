package br.com.cwi.pokemons.data.database.entity

import android.net.Uri
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
class ProfileEntity(
    @PrimaryKey val id: Int?,
    var name: String,
    var qtdFavorite: Int,
    var qtdUnlocked: Int,
    var image: String?
)