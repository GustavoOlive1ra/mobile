package br.com.cwi.pokemons.data.database

import android.app.Application
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import br.com.cwi.pokemons.data.database.dao.FavoritePokemonDao
import br.com.cwi.pokemons.data.database.dao.ProfileDao
import br.com.cwi.pokemons.data.database.dao.UnlockedPokemonDao
import br.com.cwi.pokemons.data.database.entity.FavoritePokemonEntity
import br.com.cwi.pokemons.data.database.entity.ProfileEntity
import br.com.cwi.pokemons.data.database.entity.UnlockedPokemonEntity

@Database(entities = [UnlockedPokemonEntity::class, FavoritePokemonEntity::class, ProfileEntity::class], version = 2)
abstract class AppDatabase : RoomDatabase() {

    abstract fun getUnlockedPokemonDao(): UnlockedPokemonDao

    abstract fun getFavoritePokemonDao(): FavoritePokemonDao

    abstract fun getProfileDao(): ProfileDao

    companion object {
        private const val DATABASE_NAME = "pokemon-db"
        fun create(application: Application): AppDatabase {
            return Room.databaseBuilder(
                application,
                AppDatabase::class.java,
                DATABASE_NAME
            )
                .allowMainThreadQueries()
                .fallbackToDestructiveMigration()
                .build()
        }
    }
}