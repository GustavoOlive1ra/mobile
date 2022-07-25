//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Locação on 21/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var buttonsEscolhidosNaRodada : [UIButton] = []
    var buttonsNaTela : [UIButton] = []
    
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
    
    private var jogoDaMemoria: JogoDaMemoria = .inicia()
    
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
        
        definirImagem()
    }
    
    func definirImagem(){
        for item in buttonsFirstStackView.arrangedSubviews {
            guard let btn = item as? UIButton else { return}
            jogoDaMemoria.definirImagem(button: btn)
        }
        
        for item in buttonsSecondStackView.arrangedSubviews {
            guard let btn = item as? UIButton else { return}
            jogoDaMemoria.definirImagem(button: btn)
        }
    }
    
    func retornaButton() -> UIButton{
        let button = UIButton()
        button.setImage(UIImage(named: "Card"), for: .normal)
        button.addTarget(self, action: #selector(escolherImagem(button: )), for: .touchDown)
        buttonsNaTela.append(button)
        return button
    }
    
    @objc func escolherImagem(button: UIButton){
        if(jogoDaMemoria.estado != .vitoria){
            buttonsEscolhidosNaRodada.append(button)
            button.setImage(UIImage(named: jogoDaMemoria.tentar(button: button)), for: .normal)
            let resultadoRodada = jogoDaMemoria.testarAcerto()
            switch(resultadoRodada){
            case .tentativasInsuficientes:
                break
            case .errou:
                resetarEscolhas()
            case .acertou:
                limparBufferButtons()
            }
        }

    }
    
    func resetarEscolhas(){
        for btn in buttonsEscolhidosNaRodada{
            btn.setImage(UIImage(named: "Card"), for: .normal)
        }
        limparBufferButtons()
    }

    func limparBufferButtons(){
        buttonsEscolhidosNaRodada = []
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

