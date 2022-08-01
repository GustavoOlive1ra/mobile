//
//  Double+Dinheiros.swift
//  Nospresso
//
//  Created by Treinamento on 06/10/20.
//

import Foundation

public extension Double {
    
    var comoDinheiro: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "pt-BR")
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
}
