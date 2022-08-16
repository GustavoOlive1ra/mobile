import UIKit

internal class BattleChoiceOpponentViewController: UIViewController {

    private let presenter: BattleChoiceOpponentPresenterProtocol
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.pokemon_background()
        return imageView
    }()
    
    lazy var titleFirstOppponentLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.battleTitleFirstOpponent()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var firstPokemonCard: CardPokemon = {
        let card = CardPokemon()
        return card
    }()
    
    lazy var titleSecondOppponentLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.battleChooseOpponnent()
        label.backgroundColor = .black.withAlphaComponent(0.3)
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        return collectionView
    }()

    internal init(presenter: BattleChoiceOpponentPresenterProtocol) {
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
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .label
        
        let barAppearance = UIBarAppearance()
        barAppearance.backgroundColor = .red

        let appearance = UINavigationBarAppearance(barAppearance: barAppearance)

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }


}

// MARK: - BattleChoiceOpponentViewControllerProtocol
extension BattleChoiceOpponentViewController: BattleChoiceOpponentViewProtocol {
    func reload() {
        collectionView.reloadData()
    }
    
    func setupFirstOpponent(with pokemon: PokemonDetail) {
        firstPokemonCard.setup(name: pokemon.name, imageURL: pokemon.sprite.image)
    }

}

extension BattleChoiceOpponentViewController {
    
    func configViews() {
        title = Strings.battleChoiceTitle()
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.register(CardPokemonCell.self, forCellWithReuseIdentifier: CardPokemonCell.reuseIdentifier.identifier)
    }
    
    func buildViews() {
        view.addSubview(backgroundImage)
        view.addSubview(titleFirstOppponentLabel)
        view.addSubview(firstPokemonCard)
        view.addSubview(titleSecondOppponentLabel)
        view.addSubview(collectionView)
        
    }
    
    func buildConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleFirstOppponentLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        firstPokemonCard.snp.makeConstraints { make in
            make.top.equalTo(titleFirstOppponentLabel.snp.bottom).offset(15)
            make.leading.equalTo(titleFirstOppponentLabel)
        }
        titleSecondOppponentLabel.snp.makeConstraints { make in
            make.top.equalTo(firstPokemonCard.snp.bottom).offset(15)
            make.leading.equalTo(titleFirstOppponentLabel)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleSecondOppponentLabel.snp.bottom).offset(10)
            make.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension BattleChoiceOpponentViewController: UICollectionViewDelegateFlowLayout {
    
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
