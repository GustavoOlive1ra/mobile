//
//  Habitat.swift
//  Pokedex
//
//  Created by Locação on 05/08/22.
//

import Foundation

struct Habitat: Codable {
    
    let name: HabitatName
        
    enum CodingKeys: String, CodingKey {
        case name
    }
}

enum HabitatName: String, Codable {
    case grassland
    case forest
    case cave
    case mountain
    case rougTerrain = "rough-terrain"
    case sea
    case urban
    case watersEdge = "waters-edge"
    case rare
}

