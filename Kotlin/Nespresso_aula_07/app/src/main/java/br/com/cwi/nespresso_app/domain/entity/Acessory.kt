package br.com.cwi.nespresso_app.domain.entity

class Acessory(
    val category: String,
    val itens: List<Item>
): Type(ItemType.CATEGORY)