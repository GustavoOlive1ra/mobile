//
//  APISupport.swift
//  Pokedex
//
//  Created by Locação on 02/08/22.
//

import Foundation

enum APIError: Error {
    case badUrl(string: String)
    case requestFailed(error: Error)
    case invalidData
    case decodeFailed(error: Error, textData: String?)
    
    var description: String {
        switch self {
        case .badUrl(let error):
            return "Bad URL. \(error)"
        case .requestFailed(error: let error):
            return "Request Failed: \(error)"
        case .invalidData:
            return "Invalid Data"
        case .decodeFailed(error: let error, textData: let textData):
            return "Convert Failure"
        }
    }
}

enum HTTPMethod: String {
    case post
    case `get`
    case delete
}
