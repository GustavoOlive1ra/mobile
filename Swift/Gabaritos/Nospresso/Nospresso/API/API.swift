//
//  API.swift
//  Nospresso
//
//  Created by Elias Medeiros on 06/10/20.
//

import Foundation

public typealias ResultadoSucesso<T: Decodable> = (T) -> Void
public typealias ResultadoFalha = (ErroEmRequisicao) -> Void

class API {
    let urlBase = "http://localhost:3000"

    func requisitar<T: Decodable>(endpoint: Endpoint,
                                  metodo: MetodoHTTP = .get,
                                  objeto: Encodable? = nil,
                                  sucesso: @escaping ResultadoSucesso<T>,
                                  falha: @escaping ResultadoFalha) {
        guard var url = URL(string: urlBase) else {
            falha(.urlRuim(string: urlBase))
            return
        }

        url.appendPathComponent(endpoint.url)

        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = metodo.rawValue
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requisicao.httpBody = objeto?.dadosJSON

        URLSession.shared.dataTask(with: requisicao) { dados, resposta, erro in
            guard erro == nil else {
                falha(.requisicaoFalhou(erro: erro!))
                return
            }

            guard let dados = dados else {
                falha(.dadosInvalidos)
                return
            }

            let decodificador = JSONDecoder()

            do {
                let dadosConvertidos = try decodificador.decode(T.self, from: dados)
                sucesso(dadosConvertidos)
            } catch {
                falha(.decodificacaoFalhou(erro: error, dadosEmTexto: String(data: dados, encoding: .utf8)))
            }
        }.resume()
    }
}

