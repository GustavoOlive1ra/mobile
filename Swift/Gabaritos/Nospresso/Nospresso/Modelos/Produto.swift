//
//  Produto.swift
//  Nospresso
//
//  Created by Elias Medeiros on 05/10/20.
//

import Foundation

enum TipoProduto: String, Codable {
    case maquina
    case cafe
    case acessorio
}

protocol Produto: Codable {
    var id: Int { get }
    var nome: String { get }
    var preco: Double { get }
    var imagem: String { get }
    var descricao: String { get }

    var tipo: TipoProduto { get }
}

extension Produto {
    var forCart: ProdutoSacola {
        .init(id: 0,
              idOriginal: id,
              nome: nome,
              preco: preco,
              imagem: imagem,
              descricao: descricao,
              tipo: tipo)
    }
}

