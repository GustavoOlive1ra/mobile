//
//  Colecao–Produtos+SomaDePreco.swift
//  Nospresso
//
//  Created by Elias Medeiros on 19/10/20.
//

import Foundation

extension Collection where Element: Produto {
    var valorTotal: Double {
        reduce(0, { parcial, produto in
            parcial + produto.preco
        })
    }
}

