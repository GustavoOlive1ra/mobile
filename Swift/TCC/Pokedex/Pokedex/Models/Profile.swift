//
//  Profile.swift
//  Pokedex
//
//  Created by Locação on 16/08/22.
//

import Foundation
import UIKit

struct Profile: Codable {
    var image: Data? = nil
    let id: Int = 1
    var name: String = "Your name"
    
    static let idReference: Int = 1
}
