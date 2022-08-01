//
//  Cafe.swift
//  Nospresso
//
//  Created by Elias Medeiros on 05/10/20.
//

import UIKit

enum MedidaCafe: String, Codable {
    case ristretto
    case espresso
    case lungo
    
    var imagem: UIImage {
        switch self {
        case .ristretto:
            return Imagens.ristretto()!
        case .espresso:
            return Imagens.espresso()!
        case .lungo:
            return Imagens.lungo()!
        }
    }
}

public struct Cafe: Produto {
    let id: Int
    let nome: String
    let preco: Double
    let intensidade: Int?
    let descricao: String
    let imagem: String
    let medidas: [MedidaCafe]
    let origem: String?
    let torrefacao: String?
    let perfilAromatico: String?

    var tipo: TipoProduto { .cafe }

    var precoSleeve: Double { preco * 10 }

    enum CodingKeys: String, CodingKey {
        case id
        case nome
        case preco = "precoUnitario"
        case intensidade
        case descricao
        case imagem
        case medidas
        case origem
        case torrefacao
        case perfilAromatico
    }
}
