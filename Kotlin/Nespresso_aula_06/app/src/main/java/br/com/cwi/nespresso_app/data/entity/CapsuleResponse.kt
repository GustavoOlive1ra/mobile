package br.com.cwi.nespresso_app.data.entity

import com.squareup.moshi.Json

class CapsuleResponse(
    @Json(name = "capsulas") val categories: List<CategoryResponse>
)