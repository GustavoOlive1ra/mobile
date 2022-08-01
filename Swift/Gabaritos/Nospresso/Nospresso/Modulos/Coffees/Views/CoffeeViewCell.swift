import UIKit
import Rswift

class CoffeeViewCell: UITableViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<CoffeeViewCell> = ReuseIdentifier(identifier: "coffee-cell")
    
    lazy var capsuleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansSemiBold(size: 19)
        label.textColor = Paleta.textoCinza()
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansLightItalic(size: 12)
        label.textColor = Paleta.textoCinzaDiscreto()
        return label
    }()
    
    lazy var intensityLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansLightItalic(size: 12)
        label.textColor = Paleta.textoCinzaDiscreto()
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansBold(size: 14)
        label.textColor = Paleta.verdeClaro()
        return label
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var addToFavoritesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.heart, for: .normal)
        button.tintColor = Paleta.vermelhoAmor()
        button.addTarget(self, action: #selector(addToFavoritesButtonTouched), for: .touchUpInside)
        return button
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bag.badge.plus"), for: .normal)
        button.tintColor = Paleta.textoCinza()
        button.addTarget(self, action: #selector(addToCartButtonTouched), for: .touchUpInside)
        return button
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
                   
    func setup(with coffee: Cafe) {
        print("CoffeeViewCell.setup")
        
        capsuleImageView.carregarImagem(da: coffee.imagem)
        nameLabel.text = coffee.nome
        descriptionLabel.text = coffee.descricao
        priceLabel.text = coffee.preco.comoDinheiro
        
        intensityLabel.isHidden = coffee.intensidade == nil
        if let intensity = coffee.intensidade {
            intensityLabel.text = Strings.coffeeIntensity(intensity)
        }
        
        let isAFavorite = Favorites.shared.isAFavorite(productId: coffee.id)
        addToFavoritesButton.setImage(isAFavorite ? .heartFill : .heart, for: .normal)
    }
    
    @objc private func addToFavoritesButtonTouched() {
        // TODO: add to favorites
    }
    
    @objc private func addToCartButtonTouched() {
        // TODO: add to cart
    }
    
    private func configViews() {
        backgroundColor = .white
    }
    
    private func buildViews() {
        contentView.addSubview(capsuleImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(intensityLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(buttonsStackView)
        
        buttonsStackView.addArrangedSubview(addToFavoritesButton)
        buttonsStackView.addArrangedSubview(addToCartButton)
    }
    
    private func buildConstraints() {
        capsuleImageView.snp.makeConstraints { make in
            make.size.equalTo(65)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(capsuleImageView.snp.trailing).offset(18)
            make.trailing.equalTo(buttonsStackView.snp.leading)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalTo(buttonsStackView.snp.leading)
        }
        
        intensityLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalTo(priceLabel.snp.leading)
            make.bottom.equalToSuperview().inset(10)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(intensityLabel.snp.bottom)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalTo(priceLabel.snp.trailing).offset(8)
        }
        
        addToFavoritesButton.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
    }
    
}
