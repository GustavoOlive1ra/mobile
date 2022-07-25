//
//  Capsule.swift
//  Nospresso
//
//  Created by Locação on 25/07/22.
//

import Foundation

struct Capsule: Codable {
    
    let category: String
    let coffes: [Coffee]
    
    enum CodingKeys: String, CodingKey {
        case category = "categoria"
        case coffes = "cafes"
    }
    
}
