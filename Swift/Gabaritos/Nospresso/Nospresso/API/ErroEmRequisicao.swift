//
//  ErroEmRequisicao.swift
//  Nospresso
//
//  Created by Elias Medeiros on 16/10/20.
//

import Foundation

public enum ErroEmRequisicao: Error {
    case urlRuim(string: String)
    case requisicaoFalhou(erro: Error)
    case dadosInvalidos
    case decodificacaoFalhou(erro: Error, dadosEmTexto: String?)
}
