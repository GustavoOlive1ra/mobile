//
//  Sprite.swift
//  Pokedex
//
//  Created by Locação on 05/08/22.
//

import Foundation

struct Sprite: Codable {
    
    let image: String
        
    enum CodingKeys: String, CodingKey {
        case image = "front_default"
    }

}
