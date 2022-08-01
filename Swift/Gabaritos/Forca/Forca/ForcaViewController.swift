import UIKit
import SnapKit

class ForcaViewController: UIViewController {
    
    lazy var reiniciarBotao: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icone_reiniciar"), for: .normal)
        button.addTarget(self, action: #selector(toqueBotaoRecomecar), for: .touchDown)
        return button
    }()
    
    var forcaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "forca")
        return imageView
    }()
    
    var bonecoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var textosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    var dicaLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var palpiteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    var letraTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 17)
        textField.minimumFontSize = 17
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.autocapitalizationType = .allCharacters
        textField.textAlignment = .center
        textField.keyboardType = .namePhonePad
        return textField
    }()
    
    var chutesAnterioresLabelTitulo: UILabel = {
        let label = UILabel()
        label.text = "Chutes Anteriores"
        return label
    }()
    
    var chutesAnterioresLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var jogoDaForca = JogoDaForca.aleatorio() {
        didSet {
            print("atualizou o jogo")
        }
    }

    var action: UIAlertAction {
        .init(
            title: "Jogar Novamente",
            style: .default,
            handler: { _ in
                self.novoJogo()
            })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

        esconderTecladoQuandoTocadoNaTela()
        atualizarTela()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor(named: "fundo")
        
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        letraTextField.delegate = self
        
        view.addSubview(reiniciarBotao)
        view.addSubview(forcaImageView)
        view.addSubview(bonecoImageView)
        view.addSubview(textosStackView)
        
        textosStackView.addArrangedSubview(dicaLabel)
        textosStackView.addArrangedSubview(palpiteLabel)
        textosStackView.addArrangedSubview(letraTextField)
        textosStackView.addArrangedSubview(chutesAnterioresLabelTitulo)
        textosStackView.addArrangedSubview(chutesAnterioresLabel)
    }
    
    private func addConstraints() {
        reiniciarBotao.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(25)
        }
        
        forcaImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
            make.centerX.equalToSuperview()
        }
        
        bonecoImageView.snp.makeConstraints { make in
            make.top.equalTo(forcaImageView.snp.top).offset(112)
            make.leading.equalTo(forcaImageView.snp.trailing).inset(54)
        }
        
        textosStackView.snp.makeConstraints { make in
            make.top.equalTo(forcaImageView.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
        }
        
        letraTextField.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }

    @objc func toqueBotaoRecomecar() {
        novoJogo()
    }

    func toqueTecladoPronto() {
        if let texto = letraTextField.text {
            jogoDaForca.tentativa(letra: texto)
            atualizarTela()
            letraTextField.text = ""
        }
    }

    private func novoJogo() {
        jogoDaForca = JogoDaForca.aleatorio()
        atualizarTela()
        letraTextField.text = ""
    }

    private func atualizarTela() {
        letraTextField.text = nil
        palpiteLabel.attributedText = jogoDaForca.resultadoExibido.espacado
        dicaLabel.text = "A dica é: \(jogoDaForca.dica)"
        chutesAnterioresLabel.attributedText = formatarChutesAnteriores()
        atualizarImagem()

        if jogoDaForca.derrota {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.avisarOPerdedor()
            }
        } else if jogoDaForca.vitoria {
            avisarAVencedora()
        }
    }

    private func formatarChutesAnteriores() -> NSAttributedString {
        jogoDaForca.tentativasAnteriores.reduce(NSMutableAttributedString(), { (textoAtribuido, letraTentada) in
            textoAtribuido.append(
                jogoDaForca.palavra.contains(letraTentada)
                    ? letraTentada.comCorDeAcerto
                    : letraTentada.comCorDeErro)

            return textoAtribuido
        }).espacado
    }

    // avisarSobreDerrota
    private func avisarOPerdedor() {
        let alerta = UIAlertController(title: "Que pena, você errou",
                                       message: "Pensa um pouco mais da próxima vez",
                                       preferredStyle: .alert)
        alerta.addAction(action)

        present(alerta, animated: true)
    }

    // avisarSobreVitoria
    private func avisarAVencedora() {
        let alerta = UIAlertController(title: "Você acertou, parabéns!",
                                       message: nil,
                                       preferredStyle: .alert)
        alerta.addAction(action)

        present(alerta, animated: true)
    }

    private func atualizarImagem() {
        let imagem: UIImage?

        if jogoDaForca.derrota {
            imagem = UIImage(named: "bonecao_completo_e_mortinho")
        } else if jogoDaForca.erros > 0 {
            imagem = UIImage(named: "bonecao_fase_\(jogoDaForca.erros)")
        } else {
            imagem = nil
        }

        UIView.transition(with: bonecoImageView,
                          duration: 0.1,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.bonecoImageView.image = imagem
                          },
                          completion: nil)
    }
}

extension ForcaViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        letraTextField.text = string.uppercased()
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        toqueTecladoPronto()
        return true
    }
    
}
