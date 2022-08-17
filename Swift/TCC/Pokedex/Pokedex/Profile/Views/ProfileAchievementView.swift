//
//  ProfileAchievementView.swift
//  Pokedex
//
//  Created by Locação on 16/08/22.
//

import Foundation
import UIKit

class ProfileAchievementView: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 5
        stack.layoutMargins = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    lazy var qtdLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var iconLabel: UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(qtd: String, image: UIImage?, color: UIColor?){
        qtdLabel.text = qtd
        iconLabel.image = image
        iconLabel.tintColor = color
    }
}

extension ProfileAchievementView {
    
    func configViews() {
    }
    
    func buildViews() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(iconLabel)
        stackView.addArrangedSubview(qtdLabel)
    }
    
    func buildConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

