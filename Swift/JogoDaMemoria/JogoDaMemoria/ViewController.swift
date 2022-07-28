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
    
    lazy var reiniciarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Reinicia"), for: .normal)
        button.addTarget(self, action: #selector(reiniciarBtn), for: .touchDown)
        return button
    }()
    
    lazy var reiniciarLabel: UILabel = {
        let label = UILabel()
        label.text = "Reiniciar"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        return label
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
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    @objc func reiniciarBtn(){
        reiniciar()
    }
    
    func reiniciar(){
        jogoDaMemoria = .inicia()
        definirImagem()
    }
    
    func definirImagem(){
        limparBufferButtons()
        for item in buttonsFirstStackView.arrangedSubviews {
            guard let btn = item as? UIButton else { return}
            btn.setImage(UIImage(named: "Card"), for: .normal)
            jogoDaMemoria.definirImagem(button: btn)
        }
        
        for item in buttonsSecondStackView.arrangedSubviews {
            guard let btn = item as? UIButton else { return}
            btn.setImage(UIImage(named: "Card"), for: .normal)
            jogoDaMemoria.definirImagem(button: btn)
        }
    }
    
    func retornaButton() -> UIButton{
        let button = UIButton()
        button.addTarget(self, action: #selector(escolherImagem(button: )), for: .touchDown)
        return button
    }
    
    @objc func escolherImagem(button: UIButton){
        if(jogoDaMemoria.estado != .vitoria){
            buttonsEscolhidosNaRodada.append(button)
            let stringImage = jogoDaMemoria.tentar(button: button)
            button.setImage(UIImage(named: stringImage), for: .normal)
            
            let resultadoRodada = jogoDaMemoria.testarAcerto()
            
            switch(resultadoRodada){
            case .tentativasInsuficientes:
                UIView.transition(with: button, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
            case .errou:
                UIView.transition(with: button, duration: 1, options: .transitionFlipFromRight, animations: nil){ complete in
                    self.resetarEscolhas()
                }
            case .acertou:
                UIView.transition(with: button, duration: 1, options: .transitionFlipFromRight, animations: nil){ complete in
                    self.limparBufferButtons()
                }
            case .ganhou:
                let alert = UIAlertController(title: "Boa, você terminou!"
                                              , message: "Você precisou de \(jogoDaMemoria.tentativas) tentativas para finalizar o jogo da memória."
                                              , preferredStyle: .alert)
                alert.addAction(.init(title: "Bacana, bora de novo", style: .default){_ in
                    self.reiniciar()
                })
                present(alert, animated: true)
            }
        }
    }
    
    func resetarEscolhas(){
        for btn in buttonsEscolhidosNaRodada{
            btn.setImage(UIImage(named: "Card"), for: .normal)
            UIView.transition(with: btn, duration: 2, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        limparBufferButtons()
    }

    func limparBufferButtons(){
        buttonsEscolhidosNaRodada = []
    }
    

}

extension ViewController {
    func configView() {
        view.backgroundColor = UIColor(named: "fundo")
    }
    
    func buildViews() {
        view.addSubview(reiniciarButton)
        view.addSubview(buttonsFirstStackView)
        view.addSubview(buttonsSecondStackView)
        view.addSubview(reiniciarLabel)
        
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
    
    func buildConstraints() {
        reiniciarButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.size.equalTo(30)
        }
        
        reiniciarLabel.snp.makeConstraints { make in
            make.centerY.equalTo(reiniciarButton)
            make.trailing.equalTo(reiniciarButton.snp.leading).offset(-10)
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

