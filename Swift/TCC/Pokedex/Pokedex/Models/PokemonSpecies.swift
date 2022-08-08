//
//  PokemonSpecies.swift
//  Pokedex
//
//  Created by Locação on 05/08/22.
//

import Foundation

struct PokemonSpecies: Codable {
    
    let textEntry: [FlavorText]
    let habitat: Habitat
    
    enum CodingKeys: String, CodingKey {
        case textEntry = "flavor_text_entries"
        case habitat
    }
}
