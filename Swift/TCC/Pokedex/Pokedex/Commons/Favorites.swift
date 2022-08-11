//
//  Favorite.swift
//  Pokedex
//
//  Created by Locação on 11/08/22.
//

import Foundation

class Favorites {
    
    static let shared = Favorites()
    
    private let userDefaults = UserDefaults.standard
    
    private let dataBaseKey = "FavoritesPokemon"
    
    var items: [Favorite] = []
    
    private init() {
        fetchFromDatabase()
    }
    
    func toggle(name: String) {
        defer {
            updateDatabase()
        }
        
        let favorite = Favorite(name: name)
        
        if let indexOfFoundFavorite = items.firstIndex(where: { item in
            item == favorite
        }) {
            items.remove(at: indexOfFoundFavorite)
        } else {
            items.append(favorite)
        }
    }
    
    
    func remove(name: String) {
        let favorite = Favorite(name: name)
        if let indexOfFoundFavorite = items.firstIndex(where: { item in
            item == favorite
        }) {
            items.remove(at: indexOfFoundFavorite)
        }
        
        updateDatabase()
    }
    
    func isAFavorite(name: String) -> Bool {
        items.contains { $0.name == name }
    }
    
}

private extension Favorites {
    func updateDatabase() {
        guard let jsonData =  try? JSONEncoder().encode(items) else { return }
        
        userDefaults.setValue(jsonData, forKey: dataBaseKey)
    }
    
    func fetchFromDatabase() {
        guard
            let jsonData = userDefaults.data(forKey: dataBaseKey),
            let data = try? JSONDecoder().decode([Favorite].self, from: jsonData)
        else { return }
        
        self.items = data
    }
}

