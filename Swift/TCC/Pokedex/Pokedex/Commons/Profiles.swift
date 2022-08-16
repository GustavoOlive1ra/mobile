//
//  Profile.swift
//  Pokedex
//
//  Created by Locação on 16/08/22.
//

import Foundation
import UIKit

class Profiles {
    
    static let shared = Profiles()
    
    private let userDefaults = UserDefaults.standard
    
    private let dataBaseKey = "Profile"
    
    var items: [Profile] = []
    
    private init() {
        fetchFromDatabase()
    }
    
    func update(image: UIImage) {
        defer {
            updateDatabase()
        }
        var profile = getProfile()
        profile.image = image.toData()
        
        if let indexOfFoundProfile = items.firstIndex(where: { item in
            item.id == Profile.idReference
        }) {
            items[indexOfFoundProfile] = profile
        }
    }
    
    func update(name: String) {
        defer {
            updateDatabase()
        }
        var profile = getProfile()
        profile.name = name
        
        if let indexOfFoundProfile = items.firstIndex(where: { item in
            item.id == Profile.idReference
        }){
            items[indexOfFoundProfile] = profile
        }

    }
    
    func getProfile() -> Profile {
        guard let indexOfFoundProfile = items.firstIndex(where: { item in
            item.id == Profile.idReference
        }) else {
            let newProfile = Profile()
            items.append(newProfile)
            return newProfile
        }
        return items[indexOfFoundProfile]
    }
}

private extension Profiles {
    func updateDatabase() {
        guard let jsonData =  try? JSONEncoder().encode(items) else { return }
        
        userDefaults.setValue(jsonData, forKey: dataBaseKey)
    }
    
    func fetchFromDatabase() {
        guard
            let jsonData = userDefaults.data(forKey: dataBaseKey),
            let data = try? JSONDecoder().decode([Profile].self, from: jsonData)
        else { return }
        
        self.items = data
    }
    
}
