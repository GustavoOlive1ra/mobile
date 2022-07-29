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
    var estado: EstadoJogo = .nenhumaTentativa
    var primeiraImagemEscolhida: String = ""
    var segundaImagemEscolhida: String = ""
    var estadoRodada: ResultadoRodada = .tentativasInsuficientes
    var acertos: Int = 0
    var tentativas: Int = 0
    
    init(){
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
            tentativas += 1
            if(primeiraImagemEscolhida==segundaImagemEscolhida){
                acertos += 1
                if(acertos==5){
                    estado = .vitoria
                    return .ganhou
                }
                return .acertou
            } else {
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
    case ganhou
}

let imagens = ["Card Anão", "Card Bruxa", "Card Cavaleiro", "Card Elfa", "Card Mago"]
