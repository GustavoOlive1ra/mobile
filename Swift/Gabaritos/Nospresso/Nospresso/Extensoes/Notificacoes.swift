//
//  Notificacoes.swift
//  Nospresso
//
//  Created by Elias Medeiros on 19/10/20.
//

import Foundation

extension Notification.Name {
    static let sacolaAtualizada = Notification.Name("sacola:atualizacao")
}

extension NotificationCenter {

    static let chavePadraoParaDados = "dados"

    class func publicar(nome: NSNotification.Name, objeto: Any? = nil, dados: Any?) {
        guard let dados = dados else {
            NotificationCenter.default.post(name: nome, object: objeto)
            return
        }
        NotificationCenter.default.post(name: nome, object: objeto, userInfo: [chavePadraoParaDados: dados])
    }

    class func registrar(_ observador: Any, seletor: Selector, nome: NSNotification.Name, objeto: Any? = nil) {
        NotificationCenter.default.addObserver(observador, selector: seletor, name: nome, object: objeto)
    }

    class func remover(_ observador: Any, nome: NSNotification.Name?, objeto: Any? = nil) {
        NotificationCenter.default.removeObserver(observador, name: nome, object: objeto)
    }

}

extension Notification {

    var dados: Any? {
        return self.userInfo?[NotificationCenter.chavePadraoParaDados]
    }

}

