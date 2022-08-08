//
//  Language.swift
//  Pokedex
//
//  Created by Locação on 05/08/22.
//

import Foundation

struct Language: Codable {
    
    let name: String
        
    enum CodingKeys: String, CodingKey {
        case name
    }
}
