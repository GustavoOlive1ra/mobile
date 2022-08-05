//
//  Endpoint.swift
//  Pokedex
//
//  Created by Locação on 02/08/22.
//

import Foundation

enum Endpoint {
    case pokemonBaseList(limit: Int = 151, offset: Int = 0)
    case pokemonDetail(name: String)
    case pokemonSpecies(name: String)
    
    func buildFullUrl(with baseURL: URL) -> URL {
        switch self {
        case .pokemonBaseList(let limit, let offset):
            var newURL = baseURL.appendingPathComponent("pokemon")
            newURL.append("limit", value: "\(limit)")
            newURL.append("offset", value: "\(offset)")
            return newURL
        case .pokemonDetail(let name):
            return baseURL.appendingPathComponent("pokemon/\(name)")
        case .pokemonSpecies(let name):
            return baseURL.appendingPathComponent("pokemon-species/\(name)")
        }
    }
    
    var url: String {
        switch self {
        case .pokemonBaseList(let limit, let offset):
            return "pokemon?limit=\(limit)&offset=\(offset)"
        case .pokemonDetail(let name):
            return "pokemon/\(name)"
        case .pokemonSpecies(let name):
            return "pokemon-species/\(name)"
        }
    }
}
