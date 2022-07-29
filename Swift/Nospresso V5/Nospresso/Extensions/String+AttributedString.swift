//
//  String+AttributedString.swift
//  Nospresso
//
//  Created by Treinamento on 28/07/22.
//

import Foundation
import UIKit

extension String {
    func withStyle(_ font: UIFont, _ color: UIColor) -> NSMutableAttributedString {
        let attributes: [NSMutableAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color
        ]
        
        return NSMutableAttributedString(string: self, attributes: attributes)
    }
}

extension NSMutableAttributedString {
    static func +=(lhs: inout NSMutableAttributedString, rhs: NSMutableAttributedString) {
        lhs.append(rhs)
    }
}
