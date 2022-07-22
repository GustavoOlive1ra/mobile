//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Locação on 21/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var reiniciarButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reiniciar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var cardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Card"), for: .normal)
        return button
    }()

    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        //stackView.spacing = 10
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        configView()
        buildViews()
        buildConstraints()
    }

    func configView() {
        view.backgroundColor = UIColor(named: "fundo")
    }
    
    func buildViews() {
        view.addSubview(reiniciarButton)
        view.addSubview(buttonsStackView)
        
        buttonsStackView.addArrangedSubview(retornaButton())
        buttonsStackView.addArrangedSubview(retornaButton())
        buttonsStackView.addArrangedSubview(retornaButton())
        buttonsStackView.addArrangedSubview(retornaButton())
        buttonsStackView.addArrangedSubview(retornaButton())
    }
    
    func retornaButton() -> UIButton{
        let button = UIButton()
        button.setImage(UIImage(named: "Card"), for: .normal)
        return button
    }
    
    func buildConstraints() {
        reiniciarButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        buttonsStackView.snp.makeConstraints{make in
            make.top.equalTo(reiniciarButton.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
    }
}

