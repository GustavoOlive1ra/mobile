//
//  Type.swift
//  Pokedex
//
//  Created by Locação on 05/08/22.
//

import Foundation

struct PokemonType: Codable {
    
    let type: TypeWrapper
        
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    struct TypeWrapper: Codable {
        let name: String
                
        enum CodingKeys: String, CodingKey {
            case name
        }
    }
}
