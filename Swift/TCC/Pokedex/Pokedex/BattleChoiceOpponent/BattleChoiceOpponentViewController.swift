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
    
    lazy var firstOpponentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.backgroundColor = .white
        stackView.alignment = .center
        stackView.layer.cornerRadius = 8
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    lazy var firstOpponentImage: UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.size.equalTo(90)
        }
        return image
    }()
    
    lazy var firstOpponentName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
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
        firstOpponentName.text = pokemon.name.uppercased()
        firstOpponentImage.loadImage(from: pokemon.sprite.image)
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
        view.addSubview(firstOpponentStackView)
        view.addSubview(titleSecondOppponentLabel)
        view.addSubview(collectionView)
        
        firstOpponentStackView.addArrangedSubview(firstOpponentImage)
        firstOpponentStackView.addArrangedSubview(firstOpponentName)
    }
    
    func buildConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleFirstOppponentLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        firstOpponentStackView.snp.makeConstraints { make in
            make.top.equalTo(titleFirstOppponentLabel.snp.bottom).offset(15)
            make.leading.equalTo(titleFirstOppponentLabel)
        }
        titleSecondOppponentLabel.snp.makeConstraints { make in
            make.top.equalTo(firstOpponentStackView.snp.bottom).offset(15)
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
