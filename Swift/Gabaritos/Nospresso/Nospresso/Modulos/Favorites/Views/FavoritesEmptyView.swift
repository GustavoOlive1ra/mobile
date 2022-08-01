import UIKit

class FavoritesEmptyView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.slash")
        imageView.tintColor = Paleta.vermelhoAmor()
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansSemiBold(size: 16)
        label.text = Strings.favoritesEmpty()
        label.textAlignment = .center
        label.numberOfLines = 0
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
    
    private func configViews() {
        backgroundColor = .white
    }
    
    private func buildViews() {
        addSubview(imageView)
        addSubview(label)
    }
    
    private func buildConstraints() {
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(40)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
    }
    
}
