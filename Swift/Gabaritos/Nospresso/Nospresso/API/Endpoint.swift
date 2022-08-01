//
//  Endpoint.swift
//  Nospresso
//
//  Created by Elias Medeiros on 06/10/20.
//

import Foundation

enum Endpoint {
    case capsulas
    case cafe(id: Int)
    case maquinas
    case acessorios
    case sacola
    case remocaoSacola(id: Int)

    var url: String {
        switch self {
        case .cafe(let id):
            return "cafes/\(id)"
        case .remocaoSacola(let id):
            return "sacola/\(id)"
        default:
            return "\(self)"
        }
    }
}

enum MetodoHTTP: String {
    case post
    case get
    case delete
}

extension Encodable {
    var dadosJSON: Data? { try? JSONEncoder().encode(self) }
}
