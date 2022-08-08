//
//  UnloackedPokemon.swift
//  Pokedex
//
//  Created by Locação on 08/08/22.
//

import Foundation

class UnloakedPokemon {
    
    static let shared = UnloakedPokemon()
    
    private let userDefaults = UserDefaults.standard
    
    private let dataBaseKey = "unlockedPokemon"
    
    var items: [Unloacked] = []
    
    private init() {
        fetchFromDatabase()
    }
        
    func add(pokemonName: String) {
        defer {
            updateDatabase()
        }
        items.append(Unloacked(name: pokemonName))
    }
    
    func isUnloacked(pokemonName: String) -> Bool {
        items.contains { $0.name == pokemonName }
    }
    
}

private extension UnloakedPokemon {
    func updateDatabase() {
        guard let jsonData =  try? JSONEncoder().encode(items) else { return }
        
        userDefaults.setValue(jsonData, forKey: dataBaseKey)
    }
    
    func fetchFromDatabase() {
        guard
            let jsonData = userDefaults.data(forKey: dataBaseKey),
            let data = try? JSONDecoder().decode([Unloacked].self, from: jsonData)
        else { return }
        
        self.items = data
    }
}

