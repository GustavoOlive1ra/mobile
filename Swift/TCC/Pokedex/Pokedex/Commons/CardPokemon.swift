//
//  CardPokemon.swift
//  Pokedex
//
//  Created by Locação on 15/08/22.
//

import Foundation
import UIKit
import SnapKit

class CardPokemon: UIView {
    lazy var firstOpponentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.backgroundColor = .white
        stackView.alignment = .center
        stackView.layer.cornerRadius = 8
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    lazy var firstOpponentImage: UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.size.equalTo(90)
        }
        return image
    }()
    
    lazy var firstOpponentName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
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
    
    func setup(name: String, imageURL: String){
        firstOpponentName.text = name.uppercased()
        firstOpponentImage.loadImage(from: imageURL)
    }
}

extension CardPokemon {
    
    func configViews() {
    }
    
    func buildViews() {
        addSubview(firstOpponentStackView)
        
        firstOpponentStackView.addArrangedSubview(firstOpponentImage)
        firstOpponentStackView.addArrangedSubview(firstOpponentName)
    }
    
    func buildConstraints() {
        firstOpponentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.trailing.bottom.equalToSuperview()
            make.width.equalTo(115)
            make.height.equalTo(130)
        }
    }
}
