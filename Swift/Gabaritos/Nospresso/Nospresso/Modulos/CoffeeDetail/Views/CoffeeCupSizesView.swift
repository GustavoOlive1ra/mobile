import UIKit

class CoffeeCupSizesView: UIStackView {
    
    private lazy var sizesLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansLight(size: 12)
        label.textColor = .black
        label.text = Strings.coffeeSizeTitle().uppercased()
        return label
    }()
    
    private lazy var sizesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(with sizes: [MedidaCafe]) {
        sizes.forEach {
            let sizeView = CoffeeCupSizeView()
            sizeView.setup(with: $0)
            sizesStackView.addArrangedSubview(sizeView)
        }
        
        sizesStackView.addArrangedSubview(UIView())
    }
    
    private func configViews() {
        axis = .vertical
        spacing = 6
    }
    
    private func buildViews() {
        addArrangedSubview(sizesLabel)
        addArrangedSubview(sizesStackView)
    }
    
    private func buildConstraints() {
        
    }
    
}
