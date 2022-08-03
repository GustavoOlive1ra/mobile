//
//  Endpoint.swift
//  Pokedex
//
//  Created by Locação on 02/08/22.
//

import Foundation

enum Endpoint {
    case pokemonBaseList(limit: Int?, offset: Int?)
    case pokemonDetail(name: String)
    case pokemonSpecies(name: String)
    
    var url: String {
        switch self {
        case .pokemonBaseList(let limit, let offset):
            guard let limit = limit , let offset = offset else { return "pokemon?limit=151&offset=0" }
            return "pokemon?limit=\(limit)&offset=\(offset)"
        case .pokemonDetail(let name):
            return "pokemon/\(name)"
        case .pokemonSpecies(let name):
            return "pokemon-species/\(name)"
        }
    }
}
