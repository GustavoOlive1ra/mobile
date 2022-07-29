//
//  CoffeeSize.swift
//  Nospresso
//
//  Created by Locação on 29/07/22.
//

import Foundation
import UIKit

class CoffeeSize: UIView{
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansLight(size: 12)
        label.textColor = Colors.textoCinzaDiscreto()
        return label
    }()
    
    lazy var sizeImageView: UIImageView = {
        let image = UIImageView()
        return image
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
    
    func setup(size: String){
        nameLabel.text = size
        sizeImageView.image = UIImage(named: size)
    }
}

extension CoffeeSize {
    
    func configViews() {
        
    }
    
    func buildViews() {
        addSubview(sizeImageView)
        addSubview(nameLabel)
    }
    
    func buildConstraints() {
        sizeImageView.snp.makeConstraints{make in
            make.top.leading.bottom.equalToSuperview()
            make.size.equalTo(20)
        }
        
        nameLabel.snp.makeConstraints{make in
            make.centerY.equalTo(sizeImageView)
            make.leading.equalTo(sizeImageView.snp.trailing).offset(8)
        }
    }
}
