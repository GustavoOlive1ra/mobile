import UIKit
import Rswift

class MachineViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<MachineViewCell> = ReuseIdentifier(identifier: "machine-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansSemiBold(size: 20)
        label.textColor = Paleta.textoCinza()
        return label
    }()
    
    lazy var machineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansSemiBold(size: 20)
        label.textColor = Paleta.verdeClaro()
        return label
    }()
    
    lazy var addToFavoritesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.heart, for: .normal)
        button.tintColor = Paleta.vermelhoAmor()
        button.addTarget(self, action: #selector(addToFavoritesButtonTouched), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViews()
        buildViews()
        buildConstraints()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                   
    func setup(with machine: Maquina) {
        nameLabel.text = machine.nome
        machineImageView.carregarImagem(da: machine.imagem)
        priceLabel.text = machine.preco.comoDinheiro
        
        let isAFavorite = Favorites.shared.isAFavorite(productId: machine.id)
        addToFavoritesButton.setImage(isAFavorite ? .heartFill : .heart, for: .normal)
    }
    
    @objc private func addToFavoritesButtonTouched() {
        // TODO: add to favorites
    }
    
    private func configViews() {
        backgroundColor = .white
    }
    
    private func buildViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(machineImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(addToFavoritesButton)
    }
    
    private func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        machineImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(146)
            make.width.equalTo(120)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        addToFavoritesButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(priceLabel.snp.bottom)
        }
    }
    
}
