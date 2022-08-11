//
//  Favorite.swift
//  Pokedex
//
//  Created by Locação on 11/08/22.
//

import Foundation

struct Favorite: Codable {
    let name: String
    
    static func == (lhs: Favorite, rhs: Favorite) -> Bool {
        lhs.name == rhs.name
    }
}
