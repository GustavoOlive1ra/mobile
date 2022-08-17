import UIKit

internal class PokemonDetailViewController: UIViewController {
    
    private let presenter: PokemonDetailPresenterProtocol
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var habitatImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
        
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    lazy var typeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var actionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.tintColor = Colors.star()
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleFavorite)))
        button.snp.makeConstraints { make in
            make.size.equalTo(35)
        }
        return button
    }()
    
    lazy var battleButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(Images.ic_battle(), for: .normal)
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(battle)))
        button.snp.makeConstraints { make in
            make.size.equalTo(35)
        }
        return button
    }()
    
    lazy var statsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var sizeStatItem: StatsItemView = {
        let statsItem = StatsItemView(title: "Size")
        return statsItem
    }()
    
    lazy var abilitiesStatItem: StatsItemView = {
        let statsItem = StatsItemView(title: "Abilities")
        return statsItem
    }()
    
    lazy var statusStatItem: StatsItemView = {
        let statsItem = StatsItemView(title: "Status")
        return statsItem
    }()
    
    
    lazy var textEntryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    internal init(presenter: PokemonDetailPresenterProtocol) {
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
        barAppearance.backgroundColor = Colors.cardBlue()

        let appearance = UINavigationBarAppearance(barAppearance: barAppearance)

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }


}

// MARK: - PokemonDetailViewControllerProtocol
extension PokemonDetailViewController: PokemonDetailViewProtocol {
    func setup(with pokemonSpecies: PokemonSpecies) {
        habitatImage.image = UIImage(named: pokemonSpecies.habitat.name.imageName)
        textEntryLabel.text = "Text entry: \(presenter.getTextEntry(with: pokemonSpecies))"
    }
    
    func setup(with pokemonDetail: PokemonDetail) {
        title = pokemonDetail.name.uppercased()
        nameLabel.text = pokemonDetail.name.uppercased()
        pokemonImage.loadImage(from: pokemonDetail.sprite.image)
        fillTypeStackView(with: pokemonDetail.type)
        
        sizeStatItem.setup(subititles: presenter.getSizes(with: pokemonDetail))
        abilitiesStatItem.setup(subititles: presenter.getAbilities(with: pokemonDetail))
        statusStatItem.setup(subititles: presenter.getStatus(with: pokemonDetail))
        
        setFavoriteImage()
    }

}

extension PokemonDetailViewController {
    
    @objc func battle(){
        presenter.openBattleChoice()
    }
    
    @objc func toggleFavorite(){
        presenter.toggleFavorite()
        setFavoriteImage()
    }
    
    func setFavoriteImage() {
        if presenter.isFavorite() {
            favoriteButton.setBackgroundImage(.starFill, for: .normal)
        } else {
            favoriteButton.setBackgroundImage(.star, for: .normal)
        }
    }
    
    func fillTypeStackView(with types: [PokemonType]) {
        for type in types {
            let getImageView = getTypeImageView(with: type.type.name.imageName)
            typeStackView.addArrangedSubview(getImageView)
        }
    }
    
    func getTypeImageView(with type: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: type)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(35)
        }
        return imageView
    }
}


extension PokemonDetailViewController {
    
    func configViews() {
        view.backgroundColor = .white
        removeBackButtonLabel()
    }
    
    func buildViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(habitatImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(pokemonImage)
        contentView.addSubview(typeStackView)
        contentView.addSubview(actionStackView)
        contentView.addSubview(statsStackView)
        contentView.addSubview(textEntryLabel)
        
        statsStackView.addArrangedSubview(sizeStatItem)
        statsStackView.addArrangedSubview(statusStatItem)
        statsStackView.addArrangedSubview(abilitiesStatItem)
        
        actionStackView.addArrangedSubview(favoriteButton)
        actionStackView.addArrangedSubview(battleButton)
    }
    
    func buildConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        habitatImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(habitatImage.snp.bottom).inset(20)
            make.centerX.equalTo(habitatImage)
            make.top.equalTo(pokemonImage.snp.bottom)
        }
        
        pokemonImage.snp.makeConstraints { make in
            make.centerX.equalTo(habitatImage)
            make.size.equalTo(140)
        }
        
        statsStackView.snp.makeConstraints { make in
            make.top.equalTo(habitatImage.snp.bottom)
            make.trailing.leading.equalToSuperview()
        }
        
        textEntryLabel.snp.makeConstraints { make in
            make.top.equalTo(statsStackView.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalToSuperview().offset(15)
            make.bottom.equalToSuperview()
        }
        
        typeStackView.snp.makeConstraints { make in
            make.top.equalTo(habitatImage).offset(20)
            make.leading.equalTo(habitatImage).offset(20)
        }
        
        actionStackView.snp.makeConstraints { make in
            make.top.equalTo(typeStackView)
            make.trailing.equalTo(habitatImage).inset(20)
        }
    }
}
