//
//  CategoriaCafe.swift
//  Nospresso
//
//  Created by Treinamento on 07/10/20.
//

import Foundation

struct CategoriaCafe: Decodable {
    
    let nome: String
    let capsulas: [Cafe]
    
    enum CodingKeys: String, CodingKey {
        case nome = "categoria"
        case capsulas = "cafes"
    }
}
