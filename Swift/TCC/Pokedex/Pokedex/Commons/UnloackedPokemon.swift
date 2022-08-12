//
//  UnloackedPokemon.swift
//  Pokedex
//
//  Created by Locação on 08/08/22.
//

import Foundation

class UnloackedPokemon {
    
    static let shared = UnloackedPokemon()
    
    private let userDefaults = UserDefaults.standard
    
    private let dataBaseKey = "unlockedPokemon"
    
    var items: [Unloacked] = []
    
    private init() {
        fetchFromDatabase()
    }
        
    func add(pokemonName: String, url: String) {
        defer {
            updateDatabase()
        }
        if !items.contains(where: { item in
            item.name == pokemonName
        }) {
            items.append(Unloacked(name: pokemonName, url: url))
        }
    }
    
    func isUnloacked(pokemonName: String) -> Bool {
        items.contains { $0.name == pokemonName }
    }
    
    func filterItems(withOut pokemonName: String) ->[Unloacked] {
        let itemsFilter = items.filter { unloaked in
            unloaked.name != pokemonName
        }
        return itemsFilter
    }
}

private extension UnloackedPokemon {
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

