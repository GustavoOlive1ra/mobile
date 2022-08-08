//
//  FlavorText.swift
//  Pokedex
//
//  Created by Locação on 08/08/22.
//

import Foundation

struct FlavorText: Codable {
    
    let text: String
    let language: Language
        
    enum CodingKeys: String, CodingKey {
        case text = "flavor_text"
        case language
    }
}
