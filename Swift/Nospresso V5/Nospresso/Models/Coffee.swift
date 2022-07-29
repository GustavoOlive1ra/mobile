//
//  Coffee.swift
//  Nospresso
//
//  Created by Treinamento on 22/07/22.
//

import Foundation

struct Coffee: Codable {
    
    let id: Int
    let name: String
    let description: String
    let intensity: Int?
    let price: Double
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case description = "descricao"
        case intensity = "intensidade"
        case price = "precoUnitario"
        case image = "imagem"
    }
    
}
