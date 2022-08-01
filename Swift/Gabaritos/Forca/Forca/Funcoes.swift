import Foundation

func troca(_ letraString: String, na mascara: String, original: String) -> String {
    let letra = Character(letraString)
    var resultado = mascara

    for index in original.indices {
        if original[index] == letra {
            resultado.remove(at: index)
            resultado.insert(letra, at: index)
        }
    }

    return resultado
}
