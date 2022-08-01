import UIKit

class CoffeeIntensityIndicatorView: UIStackView {
    
    private lazy var dotsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 1.5
        return stackView
    }()
    
    private lazy var intensityLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansLight(size: 11)
        label.textColor = Paleta.textoCinzaDiscreto()
        return label
    }()
    
    private let maxIntensity = 13
    private let dotSize: CGFloat = 7
    
    init() {
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(with intensity: Int) {
        addDots(by: intensity)
        intensityLabel.text = Strings.coffeeIntensity(intensity)
    }
    
    private func addDots(by quantity: Int) {
        for index in 0..<maxIntensity {
            let dot = generateDot(filled: index < quantity)
            dotsStackView.addArrangedSubview(dot)
        }

        dotsStackView.addArrangedSubview(UIView())
    }
    
    private func generateDot(filled: Bool) -> UIView {
        let view = UIView()
        
        view.snp.makeConstraints { make in make.size.equalTo(dotSize) }
        
        view.layer.cornerRadius = dotSize / 2
        
        view.layer.borderWidth = 0.4
        view.layer.borderColor = (filled ? Paleta.bordaIntensidadePreenchida() : Paleta.bordaIntensidadeVazia())?.cgColor
        
        view.backgroundColor = filled ? Paleta.intensidadePreenchida() : Paleta.intensidadeVazia()
        
        return view
    }
    
    private func configViews() {
        axis = .vertical
        spacing = 6
    }
    
    private func buildViews() {
        addArrangedSubview(dotsStackView)
        addArrangedSubview(intensityLabel)
    }
    
    private func buildConstraints() {
        
    }
    
}
