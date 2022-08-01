import UIKit

let atributoEspacamento : [NSAttributedString.Key: Any] = [
    .kern: 12
]

extension String {
    var espacado: NSMutableAttributedString {
        return NSMutableAttributedString(string: self, attributes: atributoEspacamento)
    }

    var comCorDeAcerto: NSMutableAttributedString {
        let atributos: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.green
        ]

        return NSMutableAttributedString(string: self, attributes: atributos)
    }

    var comCorDeErro: NSMutableAttributedString {
        let atributos: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red
        ]

        return NSMutableAttributedString(string: self, attributes: atributos)
    }
}

extension NSMutableAttributedString {
    var espacado: NSMutableAttributedString {
        let copiada = NSMutableAttributedString(attributedString: self)

        copiada.addAttributes(atributoEspacamento, range: NSMakeRange(0, self.length))

        return copiada
    }
}
