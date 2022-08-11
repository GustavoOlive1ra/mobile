//
//  StatsItem.swift
//  Pokedex
//
//  Created by Locação on 10/08/22.
//

import Foundation
import UIKit
import SnapKit

class StatsItemView: UIView {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleVisibility)))
        stackView.isUserInteractionEnabled = true
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var subtitlesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var showContentImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.backward")
        image.tintColor = .black
        image.transform = image.transform.rotated(by: .pi)
        return image
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        
        configViews(title: title)
        buildViews()
        buildConstraints()
    }
    
    @objc func toggleVisibility(){
        var hide: Bool = true
        for view in subtitlesStackView.arrangedSubviews {
            guard let label = view as? UILabel else {
                return
            }
            hide = label.isHidden
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                label.isHidden = !hide
            }, completion: nil)
        }
        if(hide){
            UIView.animate(withDuration:0.2, animations: {
                self.showContentImage.transform = CGAffineTransform(rotationAngle: -.pi/2)
            })
        }else{
            UIView.animate(withDuration:0.2, animations: {
                self.showContentImage.transform = CGAffineTransform(rotationAngle: .pi)
            })
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(subititles: [String]){
        for subititle in subititles {
            subtitlesStackView.addArrangedSubview(factorySubititle(with: subititle))
        }
    }
    
    private func factorySubititle(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .darkGray
        label.isHidden = true
        label.font = .systemFont(ofSize: 16)
        return label
    }
}

extension StatsItemView {
    
    func configViews(title: String) {
        titleLabel.text = title
    }
    
    func buildViews() {
        addSubview(stackView)
                
        stackView.addArrangedSubview(headerStackView)
        stackView.addArrangedSubview(subtitlesStackView)
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(showContentImage)
    }
    
    func buildConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    
}
