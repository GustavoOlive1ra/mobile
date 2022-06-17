package br.com.cwi.nespresso_app.data.entity

import com.squareup.moshi.Json

data class MachinesResponse (
    @Json(name = "maquinas") val machines: List<MachineTypeResponse>
)