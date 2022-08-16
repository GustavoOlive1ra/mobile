//
//  BattleLogCell.swift
//  Pokedex
//
//  Created by Locação on 15/08/22.
//

import Foundation
import UIKit
import Rswift
import SnapKit

class BattleLogCell: UITableViewCell {
    static let reuseIdentifier: ReuseIdentifier<BattleLogCell> = ReuseIdentifier(identifier: "battle-log-cell")
    
    lazy var resumeLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = .systemFont(ofSize: 16)
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
    
    func setup(with battleLog: BattleLog) {
        resumeLabel.text = Strings.battleLogRow(battleLog.nameAttack.uppercased(), String(battleLog.damegeCause), battleLog.nameDefense.uppercased(), String(battleLog.hpDefense))
    }
}

extension BattleLogCell {
    func configViews() {
        backgroundColor = .white
    }

    func buildViews() {
        contentView.addSubview(resumeLabel)

    }

    func buildConstraints() {
        resumeLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
