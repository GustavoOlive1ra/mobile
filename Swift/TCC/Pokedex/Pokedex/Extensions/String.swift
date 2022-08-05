//
//  String.swift
//  Pokedex
//
//  Created by Locação on 05/08/22.
//

import Foundation

extension String {
    func lastURLParameter() -> String {
        let urlSplit = self.split(separator: "/")
        guard let lastParameter = urlSplit.last else {
            return ""
        }
        return String(lastParameter)
    }
}
