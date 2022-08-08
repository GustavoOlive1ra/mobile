//
//  UIImageView+LoadImage.swift
//  Pokedex
//
//  Created by Locação on 02/08/22.
//

import Foundation

import UIKit
import Nuke

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        Nuke.loadImage(
            with: url,
            options: ImageLoadingOptions(placeholder: UIImage(systemName: "photo")),
            into: self
        )
    }
    
    func loadImage(withIdPokemon idPokemon: String) {
        let urlString: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(idPokemon).png"
        guard let url = URL(string: urlString) else {
            return
        }
        
        Nuke.loadImage(
            with: url,
            options: ImageLoadingOptions(placeholder: UIImage(systemName: "photo")),
            into: self
        )
    }
    
    
    func nalaFilter(size: CGSize) -> UIImage? {
        let brownColor = UIColor (red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
      let brownRect = CGRect (origin: .zero, size: size)

      //Colored image
      UIGraphicsBeginImageContextWithOptions(brownRect.size, true, 0.0)
      brownColor.setFill()
      UIRectFill(brownRect)
      let brownColoredImage = UIGraphicsGetImageFromCurrentImageContext()
      let brownContext = UIGraphicsGetCurrentContext()
      brownContext!.setFillColor(UIColor.white.cgColor)
      brownContext!.fill(brownRect)
      self.draw(brownRect)
      brownColoredImage?.draw(in: brownRect, blendMode: .colorDodge, alpha: 1)
      let outBrown0Image = UIGraphicsGetImageFromCurrentImageContext()

      //Multiplied image
      self.draw(brownRect)
      outBrown0Image?.draw(in: brownRect, blendMode: .multiply, alpha: 1)
      let outBrownImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()

        return outBrownImage
    }
}
