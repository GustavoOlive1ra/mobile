//
//  UIViewController+Barbadas.swift
//  Nospresso
//
//  Created by Elias Medeiros on 05/10/20.
//

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

    func removerTextoDoBotaoVoltar() {
        self.navigationItem.backBarButtonItem = .init(title: "", style: .plain, target: nil, action: nil)
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            self.present(controller, animated: true, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                controller.dismiss(animated: true, completion: nil)
            }
        }
    }
}
