package br.com.cwi.nespresso_app.data.database.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.TypeConverters
import br.com.cwi.nespresso_app.data.database.MeasuresConverter

@Entity
data class FavorityEntity(
    @PrimaryKey(autoGenerate = true) val id: Int?,
    val idProduct: Int,
    val type: ItemTypeEntity,
    val urlImage: String?,
    val unitPrice: Double,
    val name: String,
)