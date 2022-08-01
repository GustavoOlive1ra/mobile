//
//  UITableView+GambiMarota.swift
//  Nospresso
//
//  Created by Elias Medeiros on 28/10/20.
//

import UIKit

extension UITableView {
    func esconderSeparadoresInuteis() {
        let view = UIView(frame: .zero)
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 10))
        view.backgroundColor = UIColor.clear
        self.tableFooterView = view
    }
}
