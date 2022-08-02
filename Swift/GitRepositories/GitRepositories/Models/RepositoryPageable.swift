//
//  RepositoryPageable.swift
//  GitRepositories
//
//  Created by Locação on 01/08/22.
//

import Foundation

struct RepositoryPegeable: Decodable {
    let itens: [Repository]

    enum CodingKeys: String, CodingKey {
        case itens = "items"
    }
}
