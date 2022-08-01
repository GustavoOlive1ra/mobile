import Foundation

class JogoDaForca {
    let palavra: String
    let dica: String

    let maximoErros = 5

    var resultadoExibido: String {
        palavraMascarada
    }

    private(set) var palavraMascarada: String
    private(set) var tentativasAnteriores = [String]()
    private(set) var vitoria: Bool = false
    private(set) var derrota: Bool = false
    var erros = 0 {
        didSet {
            if erros > maximoErros {
                derrota = true
            }
        }
    }

    internal init(palavra: String, dica: String) {
        self.palavra = palavra.comparavel
        self.dica = dica.uppercased()
        self.palavraMascarada = palavra.map { _ in "_"}.joined()
    }

    func tentativa(letra: String) {
        guard let letraInformada = letra.first?.comparavel else { return }

        if tentativasAnteriores.contains(letraInformada) {
            // validar repetida
            return
        }

        tentativasAnteriores.append(letraInformada)

        guard palavra.contains(letraInformada) else {
            // marcar falha
            erros += 1
            return
        }

        palavraMascarada = troca(letraInformada, na: palavraMascarada, original: palavra)

        if palavra.comparavel == palavraMascarada.comparavel {
            vitoria = true
        }
    }
}

extension JogoDaForca {
    class func aleatorio() -> JogoDaForca {
        guard let item = palavras.randomElement() else {
            return JogoDaForca(palavra: "pantanal", dica: "bioma em franca destruição")
        }

        return JogoDaForca(palavra: item.key, dica: item.value)
    }
}

let palavras = [
    "abelha": "inseto",
    "formiga": "inseto",
    "macaco": "animal",
    "cabra": "animal"
]

