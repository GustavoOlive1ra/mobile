//
//  TipoProduto+IU.swift
//  Nospresso
//
//  Created by Elias Medeiros on 21/10/20.
//

import UIKit

extension TipoProduto {
    var cor: UIColor? {
        switch self {
        case .acessorio:
            return Paleta.acessorios()
        case .cafe:
            return Paleta.cafes()
        case .maquina:
            return Paleta.maquinas()
        }
    }
}

extension TipoProduto: CustomStringConvertible {
    var description: String {
        switch self {
        case .acessorio:
            return "acessório"
        case .cafe:
            return "café"
        case .maquina:
            return "máquina"
        }
    }
}
