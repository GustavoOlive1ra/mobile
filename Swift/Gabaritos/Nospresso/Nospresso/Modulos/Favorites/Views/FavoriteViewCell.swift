import UIKit
import Rswift

class FavoriteViewCell: UITableViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<FavoriteViewCell> = ReuseIdentifier(identifier: "favorite-cell")
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var textsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fill
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansSemiBold(size: 18)
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansBold(size: 10)
        label.textColor = Paleta.cafes()
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansBold(size: 15)
        label.textColor = Paleta.verdeClaro()
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
                   
    func setup(with product: Produto) {
        productImageView.carregarImagem(da: product.imagem)
        nameLabel.text = product.nome
        categoryLabel.text = product.tipo.description.uppercased()
        categoryLabel.textColor = product.tipo.cor
        priceLabel.text = product.preco.comoDinheiro
    }
    
    private func configViews() {
        backgroundColor = .white
    }
    
    private func buildViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(textsStackView)
        contentView.addSubview(priceLabel)
        
        textsStackView.addArrangedSubview(nameLabel)
        textsStackView.addArrangedSubview(categoryLabel)
    }
    
    private func buildConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(80)
        }
        
        textsStackView.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(18)
            make.centerY.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(textsStackView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
}
