//
//  ProdutoSacola.swift
//  Nospresso
//
//  Created by Hedo Junior on 17/10/20.
//

import Foundation

struct ProdutoSacola: Produto {
    let id: Int
    let idOriginal: Int
    let nome: String
    let preco: Double
    let imagem: String
    let descricao: String
    let tipo: TipoProduto
}

struct ProdutoRemovido: Decodable {

}
