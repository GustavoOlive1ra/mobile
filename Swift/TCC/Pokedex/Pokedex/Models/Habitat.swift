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
    
    var imageName: String {
        switch self {
        case .grassland:
            return "grassland_2"
        case .rougTerrain:
            return "rough_terrain"
        case .watersEdge:
            return "waters_edge"
        case .rare:
            return "grassland"
        default:
            return self.rawValue
        }
    }
}

