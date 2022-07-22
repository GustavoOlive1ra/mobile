//
//  ViewController.swift
//  Forca
//
//  Created by Treinamento on 19/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var reiniciarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icone_reiniciar"), for: .normal)
        button.addTarget(self, action: #selector(resetButtonTouched), for: .touchDown)
        return button
    }()
    
    lazy var forcaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "forca")
        return imageView
    }()
    
    lazy var bonecoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var textosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var dicaLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var palpiteLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var letraTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.keyboardType = .namePhonePad
        textField.delegate = self
        return textField
    }()
    
    lazy var chutesAnterioresLabelTitulo: UILabel = {
        let label = UILabel()
        label.text = "Chutes Anteriores"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var chutesAnterioresLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    internal var jogoDaForca = JogoDaForca.aleatorio()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        update()
    }
    
    @objc func resetButtonTouched() {
        reset()
    }
    
    func reset(){
        jogoDaForca = .aleatorio()
        update()
    }
    
    func alert(titulo: String, descricao: String?){
        let alert = UIAlertController(title: titulo, message: descricao, preferredStyle: .alert)
        alert.addAction(.init(title: "Jogar Novamente", style: .default){_ in
            self.reset()
        })
        present(alert, animated: true)
        
    }
    
    
    func formatarChutes()-> NSMutableAttributedString{
        jogoDaForca.tentativasAnteriores.reduce(NSMutableAttributedString()){(partialResult, letra) in
            let letraComCor: NSAttributedString = jogoDaForca.palavra.comparavel.contains(letra) ? letra.comCorDeAcerto : letra.comCorDeErro
            partialResult.append(letraComCor)
            return partialResult
        }.espacado
    }
    
    func update(){
        dicaLabel.text = "A dica é: \(jogoDaForca.dica)"
        palpiteLabel.attributedText = jogoDaForca.palavraMascarada.espacado
        chutesAnterioresLabel.attributedText = formatarChutes()
        UIView.transition(with: bonecoImageView, duration: 0.3, options: .transitionCrossDissolve, animations:{
            if self.jogoDaForca.estado == .derrota{
                self.bonecoImageView.image = UIImage(named: "bonecao_completo_e_mortinho")
            }else{
                self.bonecoImageView.image = UIImage(named: "bonecao_fase_\(self.jogoDaForca.erros)")
            }
        }, completion: nil)
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textField(_  textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        letraTextField.text = string.uppercased() 
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let texto = textField.text {
            jogoDaForca.tentar(letra: texto)
        }
        if jogoDaForca.estado == .vitoria{
            alert(titulo: "Voce acertou, parabens!", descricao: nil)
        }else if jogoDaForca.estado == .derrota{
            alert(titulo: "Que pena, voce errou", descricao: "Pensa um pouco mais da próxima vez")
        }
        
        update()
        return true
    }
}


// MARK: - setup das views
extension ViewController{
    func configViews() {
        view.backgroundColor = UIColor(named: "fundo")
    }
    
    func buildViews() {
        view.addSubview(reiniciarButton)
        view.addSubview(forcaImageView)
        view.addSubview(bonecoImageView)
        view.addSubview(textosStackView)
        
        textosStackView.addArrangedSubview(dicaLabel)
        textosStackView.addArrangedSubview(palpiteLabel)
        textosStackView.addArrangedSubview(letraTextField)
        textosStackView.addArrangedSubview(chutesAnterioresLabelTitulo)
        textosStackView.addArrangedSubview(chutesAnterioresLabel)
    }
    
    func buildConstraints() {
        reiniciarButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(22)
        }
        
        forcaImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
        }
        
        bonecoImageView.snp.makeConstraints { make in
            make.trailing.equalTo(forcaImageView).inset(8)
            make.top.equalTo(forcaImageView.snp.centerY).offset(-18)
        }
        
        textosStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forcaImageView.snp.bottom).offset(24)
        }
        
        letraTextField.snp.makeConstraints { make in
//            make.width.height.equalTo(40)
            
            make.size.equalTo(40)
        }
    }
}
