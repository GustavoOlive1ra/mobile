//
//  PokemonBase.swift
//  Pokedex
//
//  Created by Locação on 02/08/22.
//

import Foundation

struct PokemonBase: Codable {
    
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
