package br.com.cwi.nespresso_app.products.coffee

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import br.com.cwi.nespresso_app.R

class CoffeeActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_coffee)

        //Exemplo de passagem de paremetro entre Activities
        val mensagem : String? = intent.getStringExtra("EXTRA_MESSAGE")

        AlertDialog.Builder(this)
            .setMessage("OPA")
            .setTitle(mensagem)
            .show()
    }
}