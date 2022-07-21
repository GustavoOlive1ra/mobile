//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Locação on 21/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var reiniciarLabel: UILabel = {
        let label = UILabel()
        label.text = "Reiniciar"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
        view.addSubview(reiniciarLabel)
        reiniciarLabel.snp.makeConstraints{make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        
    }


}

