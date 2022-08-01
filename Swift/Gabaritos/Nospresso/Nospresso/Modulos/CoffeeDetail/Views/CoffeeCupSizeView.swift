import UIKit

class CoffeeCupSizeView: UIView {
    
    private lazy var sizeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansLight(size: 12)
        label.textColor = Paleta.textoCinzaDiscreto()
        return label
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
    
    public func setup(with size: MedidaCafe) {
        sizeImageView.image = size.imagem
        sizeLabel.text = size.rawValue
    }
    
    private func configViews() {
        
    }
    
    private func buildViews() {
        addSubview(sizeImageView)
        addSubview(sizeLabel)
    }
    
    private func buildConstraints() {
        sizeImageView.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.bottom.leading.top.equalToSuperview()
        }
        
        sizeLabel.snp.makeConstraints { make in
            make.leading.equalTo(sizeImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(sizeImageView.snp.centerY)
        }
    }
    
}

