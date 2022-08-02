//
//  RepositoryTableViewCell.swift
//  GitRepositories
//
//  Created by Locação on 01/08/22.
//

import Foundation
import UIKit
import Rswift

class RepositoryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<RepositoryTableViewCell> = ReuseIdentifier(identifier: "repository-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(17)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.grey_light()
        label.font = label.font.withSize(11)
        label.numberOfLines = 0
        return label
    }()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RepositoryTableViewCell {
    func setup(repository: Repository){
        nameLabel.text = repository.name
        descriptionLabel.text = repository.description
    }
    
    func configViews() {
        backgroundColor = .white
    }

    func buildViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
    }

    func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(14)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
            make.bottom.trailing.equalToSuperview()
        }
    }
}
