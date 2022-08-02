//
//  UIViewController+QoL.swift
//  GitRepositories
//
//  Created by Locação on 01/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func removeBackButtonLabel() {
        navigationItem.backBarButtonItem = .init(title: "", style: .plain, target: nil, action: nil)
    }
}
