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
    
    
    func loadImageWithFilter(withIdPokemon idPokemon: String, desiredColor: UIColor) {
            let urlString: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(idPokemon).png"
            guard let url = URL(string: urlString) else {
                return
            }

            ImagePipeline.shared.loadImage(with: url, queue: nil, progress: nil) { result in
                switch result {
                case .failure:
                    self.image = ImageLoadingOptions.shared.failureImage
                    self.contentMode = .scaleAspectFit
                case let .success(imageResponse):
                    
                    let imageSize: CGSize = imageResponse.image.size
                    let imageScale: CGFloat = imageResponse.image.scale
                    let contextBounds: CGRect = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)

                    UIGraphicsBeginImageContextWithOptions(imageSize, false, imageScale)
                        UIColor.black.setFill()
                        UIRectFill(contextBounds)
                        imageResponse.image.draw(at: .zero)
                        let imageOverBlack: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
                        desiredColor.setFill()
                        UIRectFill(contextBounds)

                        imageOverBlack!.draw(at: .zero, blendMode: .multiply, alpha: 1)
                        imageResponse.image.draw(at: .zero, blendMode: .destinationIn, alpha: 1)

                        let finalImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()

                    self.image = finalImage
                    self.contentMode = .scaleAspectFill
                }
            }
    }
}
