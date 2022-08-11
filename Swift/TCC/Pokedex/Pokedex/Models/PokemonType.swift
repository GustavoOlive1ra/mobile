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
        let name: TypeName
                
        enum CodingKeys: String, CodingKey {
            case name
        }
    }
}

enum TypeName: String, Codable {
    case bug
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
    
    var imageName: String {
      return "ic_\(self.rawValue)_type"
    }
}
