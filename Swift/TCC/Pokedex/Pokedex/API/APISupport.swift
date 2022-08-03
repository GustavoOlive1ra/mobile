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
}

enum HTTPMethod: String {
    case post
    case `get`
    case delete
}
