import UIKit
import SnapKit

internal class PokemonViewController: UIViewController, LoadingIndicatorViewType {
    var loadingIndicatorViewController: UIViewController?
    
    private let presenter: PokemonPresenterProtocol
    
    lazy var pokemonLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.pokemon_logo()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.pokemon_background()
        return imageView
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        return collectionView
    }()

    internal init(presenter: PokemonPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

extension PokemonViewController {
    func configViews() {
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.register(CardPokemonCell.self, forCellWithReuseIdentifier: CardPokemonCell.reuseIdentifier.identifier)
    }
    
    func buildViews() {
        view.addSubview(backgroundImage)
        view.addSubview(pokemonLogoImage)
        view.addSubview(collectionView)
    }
    
    func buildConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pokemonLogoImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(pokemonLogoImage.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - PokemonViewControllerProtocol
extension PokemonViewController: PokemonViewProtocol {
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension PokemonViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CollectionViewLayoutConstants.cellSize(basedOn: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(
            top: CollectionViewLayoutConstants.verticalSpacing,
            left: CollectionViewLayoutConstants.horizontalSpacing,
            bottom: CollectionViewLayoutConstants.verticalSpacing,
            right: CollectionViewLayoutConstants.horizontalSpacing
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewLayoutConstants.horizontalSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewLayoutConstants.verticalSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.touchedCollectionView(index: indexPath.item)
    }
        
}

enum CollectionViewLayoutConstants {
    static let horizontalSpacing: CGFloat = 16
    static let verticalSpacing: CGFloat = 20
    
    static func cellSize(basedOn collectionViewWidth: CGFloat) -> CGSize {
        .init(width: (collectionViewWidth - (horizontalSpacing*2)) / 3 - horizontalSpacing, height: 130)
    }
}
