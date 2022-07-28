//
//  UIViewController+QoL.swift
//  Nospresso
//
//  Created by Elias on 26/07/22.
//

import UIKit

extension UIViewController {
    func removeBackButtonLabel() {
        navigationItem.backBarButtonItem = .init(title: "", style: .plain, target: nil, action: nil)
    }
}
