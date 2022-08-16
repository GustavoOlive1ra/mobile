//
//  UIImage+Data.swift
//  Pokedex
//
//  Created by Locação on 16/08/22.
//

import Foundation
import UIKit

extension Data {
    func toUIImage() -> UIImage {
        let decoded = try! PropertyListDecoder().decode(Data.self, from: self)
        return UIImage(data: decoded) ?? UIImage(systemName: "person")!
    }
}

extension UIImage {
    func toData() -> Data {
        guard let data = self.jpegData(compressionQuality: 1) else { return Data() }
        return try! PropertyListEncoder().encode(data)
    }
}
