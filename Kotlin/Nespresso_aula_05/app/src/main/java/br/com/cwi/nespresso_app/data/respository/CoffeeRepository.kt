package br.com.cwi.nespresso_app.data.respository

import android.content.Context
import br.com.cwi.nespresso_app.data.entity.CapsuleResponse
import br.com.cwi.nespresso_app.data.entity.MachinesResponse
import com.squareup.moshi.JsonAdapter
import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory

class CoffeeRepository(private val context: Context) {

    private val moshi = Moshi.Builder()
        .addLast(KotlinJsonAdapterFactory())
        .build()

    fun getCapsule(): CapsuleResponse? {
        val jsonCapsules = getJsonFromFile("nespresso-capsulas.json")
        val jsonAdapter: JsonAdapter<CapsuleResponse> = moshi.adapter(CapsuleResponse::class.java)

        return jsonAdapter.fromJson(jsonCapsules)
    }

    //TODO: FAZER FUNCIONAR
    fun getMachines(): MachinesResponse? {
        val jsonCapsules = getJsonFromFile("nespresso-maquinas.json")
        val jsonAdapter: JsonAdapter<MachinesResponse> = moshi.adapter(MachinesResponse::class.java)

        return jsonAdapter.fromJson(jsonCapsules)
    }

    private fun getJsonFromFile(file: String) =
        context.assets.open(file).bufferedReader().readText()

}