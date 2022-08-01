import UIKit

class CategoryHeaderView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansLightItalic(size: 21)
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
    
    func setup(with title: String) {
        titleLabel.text = title
    }
    
    private func configViews() {
        backgroundColor = Paleta.fundoCinza()
    }
    
    private func buildViews() {
        addSubview(titleLabel)
    }
    
    private func buildConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
        }
    }
    
}
