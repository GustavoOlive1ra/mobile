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

    lazy var buttonsFirstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    lazy var buttonsSecondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
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
        view.addSubview(buttonsFirstStackView)
        view.addSubview(buttonsSecondStackView)
        
        buttonsFirstStackView.addArrangedSubview(retornaButton())
        buttonsFirstStackView.addArrangedSubview(retornaButton())
        buttonsFirstStackView.addArrangedSubview(retornaButton())
        buttonsFirstStackView.addArrangedSubview(retornaButton())
        buttonsFirstStackView.addArrangedSubview(retornaButton())
        
        buttonsSecondStackView.addArrangedSubview(retornaButton())
        buttonsSecondStackView.addArrangedSubview(retornaButton())
        buttonsSecondStackView.addArrangedSubview(retornaButton())
        buttonsSecondStackView.addArrangedSubview(retornaButton())
        buttonsSecondStackView.addArrangedSubview(retornaButton())
        
        for item in buttonsFirstStackView.arrangedSubviews {
            guard let btn = item as? UIButton else { return}
            recebeButton(button: btn)
        }
        
        for item in buttonsSecondStackView.arrangedSubviews {
            guard let btn = item as? UIButton else { return}
            recebeButton(button: btn)
        }
    }
    
    func retornaButton() -> UIButton{
        let button = UIButton()
        button.setImage(UIImage(named: "Card"), for: .normal)
        return button
    }
    
    func recebeButton(button: UIButton){
        print(button)
    }
    
    func buildConstraints() {
        reiniciarButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        buttonsFirstStackView.snp.makeConstraints{make in
            make.top.equalTo(reiniciarButton.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
        buttonsSecondStackView.snp.makeConstraints{make in
            make.top.equalTo(buttonsFirstStackView.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
    }
}

