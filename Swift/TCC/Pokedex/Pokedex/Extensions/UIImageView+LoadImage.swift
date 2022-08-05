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
}
