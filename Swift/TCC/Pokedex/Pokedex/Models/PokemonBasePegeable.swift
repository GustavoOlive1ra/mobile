//
//  PokemonBasePegeable.swift
//  Pokedex
//
//  Created by Locação on 02/08/22.
//

import Foundation

struct PokemonBasePegeable: Codable {
    
    let pokemons: [PokemonBase]
    
    enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
    
}
