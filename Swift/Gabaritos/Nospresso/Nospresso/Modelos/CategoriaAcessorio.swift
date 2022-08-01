//
//  CategoriaAcessorio.swift
//  Nospresso
//
//  Created by Hedo Junior on 22/10/20.
//

import Foundation

struct CategoriaAcessorio: Codable {
    let acessorios: [Acessorio]
    let nome: String
    
    enum CodingKeys: String, CodingKey {
        case acessorios = "itens"
        case nome = "categoria"
    }
}
