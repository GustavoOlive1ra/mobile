//
//  VerticalSeparator.swift
//  Pokedex
//
//  Created by Locação on 16/08/22.
//

import Foundation
import UIKit

class VerticalSeparator: UIView {
    lazy var rectangle: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = Colors.separator()
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
}

extension VerticalSeparator {
    
    func configViews() {
    }
    
    func buildViews() {
        addSubview(rectangle)
    }
    
    func buildConstraints() {
        rectangle.snp.makeConstraints { make in
            make.width.equalTo(2)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
    }
}
