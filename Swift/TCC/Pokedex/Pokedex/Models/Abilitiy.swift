//
//  Abilities.swift
//  Pokedex
//
//  Created by Locação on 05/08/22.
//

import Foundation

struct Ability: Codable {
    
    let ability: AbilityWrapper
        
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
    }
    
    struct AbilityWrapper: Codable {
        let name: String
                
        enum CodingKeys: String, CodingKey {
            case name = "name"
        }
    }
}

