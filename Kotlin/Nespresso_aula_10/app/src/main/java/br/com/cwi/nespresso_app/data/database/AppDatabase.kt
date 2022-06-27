package br.com.cwi.nespresso_app.data.database

import android.app.Application
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import br.com.cwi.nespresso_app.data.database.dao.FavorityDao
import br.com.cwi.nespresso_app.data.database.entity.FavorityEntity

@Database(entities = [FavorityEntity::class], version = 1)
abstract class AppDatabase : RoomDatabase() {

    abstract fun getCoffeeDao(): FavorityDao

    companion object {
        private const val DATABASE_NAME = "nespresso-db"
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