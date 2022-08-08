//
//  CardPokemon.swift
//  Pokedex
//
//  Created by Locação on 04/08/22.
//

import Foundation
import UIKit
import Rswift
import Nuke

class CardPokemonCell: UICollectionViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<CardPokemonCell> = ReuseIdentifier(identifier: "cardPokemon-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var cardImage: UIImageView = {
        let image = UIImageView()
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
    
    func setup(with pokemonBase: PokemonBase, isUnloacked: Bool) {
        cardImage.loadImage(withIdPokemon: pokemonBase.url.lastURLParameter())
        if isUnloacked {
            nameLabel.text = pokemonBase.name.uppercased()
            nameLabel.textColor = .black
            contentView.backgroundColor = .white
        } else {
            nameLabel.text = Strings.unloackedPokemonName()
            nameLabel.textColor = .white
            contentView.backgroundColor = Colors.cardBlue()
        }
    }
    
}

extension CardPokemonCell {
    
    func configViews() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
    func buildViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(cardImage)
    }
    
    func buildConstraints() {
        cardImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(90)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cardImage.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
}
