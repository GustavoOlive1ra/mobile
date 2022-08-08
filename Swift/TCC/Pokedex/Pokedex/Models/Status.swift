//
//  Status.swift
//  Pokedex
//
//  Created by Locação on 05/08/22.
//

import Foundation


struct Status: Codable {
    
    let stats: StatusWrapper
    let value: Int
        
    enum CodingKeys: String, CodingKey {
        case stats = "stat"
        case value = "base_stat"
    }
    
    struct StatusWrapper: Codable {
        let name: String
                
        enum CodingKeys: String, CodingKey {
            case name
        }
    }
}
