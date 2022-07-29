//
//  Endpoint.swift
//  Nospresso
//
//  Created by Elias on 26/07/22.
//

import Foundation

enum Endpoint {
    case capsules
    case coffees(id: Int?)
    case machines
    case bag
    case accessories
    
    var url: String {
        switch self {
        case .coffees(let id):
            guard let id = id else { return "coffees" }
            
            return "coffees/\(id)"
        default:
            return "\(self)"
        }
    }
}
