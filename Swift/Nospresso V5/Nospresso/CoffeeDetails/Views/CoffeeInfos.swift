//
//  CoffeeInfos.swift
//  Nospresso
//
//  Created by Locação on 29/07/22.
//

import Foundation
import UIKit

class CoffeeInfos: UIView{
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansSemiBold(size: 14)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansRegular(size: 14)
        label.textColor = Colors.textoCinzaDiscreto()
        label.numberOfLines = 0
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
    
    func setup(title: String, description: String){
        titleLabel.text = title
        descriptionLabel.text = description
    }
}

extension CoffeeInfos {
    
    func configViews() {
        
    }
    
    func buildViews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints{make in
            make.top.leading.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
    }
    
}
