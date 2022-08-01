//
//  UIImageView+CarregarImagem.swift
//  Nospresso
//
//  Created by Treinamento on 07/10/20.
//

import UIKit
import Nuke

public extension UIImageView {
    
    func carregarImagem(da url: String) {
        guard let url = URL(string: url) else { return }
        
        Nuke.loadImage(with: url,
                       options: ImageLoadingOptions(placeholder: UIImage(systemName: "photo")),
                       into: self)
    }
    
}
