import UIKit

public extension UIViewController {
    func esconderTecladoQuandoTocadoNaTela() {
        let toque = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dispensarTeclado))
        toque.cancelsTouchesInView = false
        view.addGestureRecognizer(toque)
    }

    @objc
    func dispensarTeclado() {
        view.endEditing(true)
    }
}
