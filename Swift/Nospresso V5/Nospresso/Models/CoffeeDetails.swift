//
//  CoffeeDetails.swift
//  Nospresso
//
//  Created by Treinamento on 28/07/22.
//

import Foundation

struct CoffeeDetails: Codable {
    
    let id: Int
    let name: String
    let description: String
    let intensity: Int?
    let price: Double
    let image: String
    let sizes: [String]
    let origin: String
    let roasting: String
    let aromaticProfile: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case description = "descricao"
        case intensity = "intensidade"
        case price = "precoUnitario"
        case image = "imagem"
        case sizes = "medidas"
        case origin = "origem"
        case roasting = "torrefacao"
        case aromaticProfile = "perfilAromatico"
    }
    
}
