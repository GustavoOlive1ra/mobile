//
//  JogoDaMemoria.swift
//  JogoDaMemoria
//
//  Created by Locação on 22/07/22.
//

import Foundation
import UIKit

class JogoDaMemoria{
    var cartas = [UIButton : String]()
    var estado: EstadoJogo
    var primeiraImagemEscolhida: String
    var segundaImagemEscolhida: String
    var estadoRodada: ResultadoRodada
    
    init(){
        estado = .nenhumaTentativa
        primeiraImagemEscolhida = ""
        segundaImagemEscolhida = ""
        estadoRodada = .tentativasInsuficientes
        cartas = [:]
    }
    
    func definirImagem(button: UIButton){
        if(cartas.count < 10){
            var imagemEscolhida = true
            while(imagemEscolhida){
                let cardImageEscolhido = imagens.randomElement()
                let qtdCardsJaEscolhidos = cartas.filter({$0.value == cardImageEscolhido}).count
                if(qtdCardsJaEscolhidos < 2){
                    cartas[button] = cardImageEscolhido
                    imagemEscolhida = false
                }
            }
        }
    }
    
    func tentar(button: UIButton)-> String {
        guard let image = cartas[button] else {return ""}
        switch(estado){
        case .nenhumaTentativa:
            primeiraImagemEscolhida = image
            estado = .primeiraTentativa
        case .primeiraTentativa:
            segundaImagemEscolhida = image
            estado = .segundaTentativa
        default:
            break
        }
        return image
    }
    
    func testarAcerto() -> ResultadoRodada{
        if(estado == .segundaTentativa){
            if(primeiraImagemEscolhida==segundaImagemEscolhida){
                resetRodada()
                return .acertou
            } else {
                resetRodada()
                return .errou
            }
        }else{
            return .tentativasInsuficientes
        }
    }
    
    func resetRodada(){
        estado = .nenhumaTentativa
        primeiraImagemEscolhida = ""
        segundaImagemEscolhida = ""
    }
    
}

extension JogoDaMemoria{
    class func inicia()-> JogoDaMemoria {
        return .init()
    }
}

enum EstadoJogo{
    case nenhumaTentativa
    case primeiraTentativa
    case segundaTentativa
    case vitoria
}

enum ResultadoRodada{
    case tentativasInsuficientes
    case errou
    case acertou
}

let imagens = ["Card Anão", "Card Bruxa", "Card Cavaleiro", "Card Elfa", "Card Mago"]
