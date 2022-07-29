//
//  CoffeeIntensity.swift
//  Nospresso
//
//  Created by Treinamento on 28/07/22.
//

import UIKit

class CoffeeIntensity: UIView {
    
    private let intensityRange = 1...13
    private let dotSize = 8
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var intensityLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansLight(size: 11)
        label.textColor = Colors.textoCinzaDiscreto()
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(intensity: Int) {
        createDots(intensity: intensity)
        intensityLabel.text = Localizable.intensity(intensity)
    }
    
    private func createDots(intensity: Int) {
        for index in intensityRange {
            let view  = createDotView(filled: index <= intensity)
            stackView.addArrangedSubview(view)
        }
    }
    
    private func createDotView(filled: Bool) -> UIView {
        let view = UIView()
        
        view.snp.makeConstraints { make in make.size.equalTo(dotSize) }
        
        view.backgroundColor = filled ? Colors.intensidadePreenchida() : Colors.intensidadeVazia()
        view.layer.borderColor = filled ? Colors.bordaIntensidadePreenchida()?.cgColor : Colors.bordaIntensidadeVazia()?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        return view
    }
    
}

extension CoffeeIntensity {
    
    func configViews() {
        
    }
    
    func buildViews() {
        addSubview(stackView)
        addSubview(intensityLabel)
    }
    
    func buildConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        intensityLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(4)
            make.leading.equalTo(stackView)
            make.bottom.equalToSuperview()
        }
    }
    
}
