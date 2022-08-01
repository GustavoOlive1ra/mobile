//
//  Maquina.swift
//  Nospresso
//
//  Created by Elias Medeiros on 05/10/20.
//

import Foundation

struct Maquina: Produto {
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String
    let imagem: String

    var tipo: TipoProduto { .maquina }
}
