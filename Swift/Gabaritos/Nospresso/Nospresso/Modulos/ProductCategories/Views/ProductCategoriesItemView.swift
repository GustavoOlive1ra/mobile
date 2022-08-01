import UIKit
import SnapKit

enum ProductCategoriesItemViewType {
    case coffees
    case machines
    case accessories
}

protocol ProductCategoriesItemViewDelegate {
    func touched(type: ProductCategoriesItemViewType)
}

class ProductCategoriesItemView: UIView {
    
    var delegate: ProductCategoriesItemViewDelegate?
    
    private let type: ProductCategoriesItemViewType
    
    lazy var textsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansBold(size: 26)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansLight(size: 14)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(type: ProductCategoriesItemViewType) {
        self.type = type
        
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String, description: String, image: UIImage?) {
        titleLabel.text = title
        descriptionLabel.text = description
        imageView.image = image
    }
    
    @objc private func touched() {
        delegate?.touched(type: type)
    }
    
    private func configViews() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.touched))
        addGestureRecognizer(gesture)
    }
    
    private func buildViews() {
        addSubview(textsStackView)
        addSubview(imageView)
        
        textsStackView.addArrangedSubview(titleLabel)
        textsStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func buildConstraints() {
        textsStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(28)
            make.bottom.equalToSuperview().inset(20)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
        }
    }
    
}
