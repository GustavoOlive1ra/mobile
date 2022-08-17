//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Locação on 05/08/22.
//

import Foundation

struct PokemonDetail: Codable {
    
    let id: Int
    let height: Int
    let name: String
    let weight: Int
    let abilities: [Ability]
    let status: [Status]
    let type: [PokemonType]
    
    enum CodingKeys: String, CodingKey {
        case id
        case height
        case weight
        case name
        case abilities
        case status = "stats"
        case type = "types"
    }
}
