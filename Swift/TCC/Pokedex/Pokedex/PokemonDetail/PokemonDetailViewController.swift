import UIKit

internal class PokemonDetailViewController: UIViewController {
    
    private let presenter: PokemonDetailPresenterProtocol
    
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
    
    lazy var statsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
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
    }
    
    func setup(with pokemonDetail: PokemonDetail) {
        title = pokemonDetail.name.uppercased()
        nameLabel.text = pokemonDetail.name.uppercased()
        pokemonImage.loadImage(from: pokemonDetail.sprite.image)
        sizeStatItem.setup(subititles: presenter.getSizes(with: pokemonDetail))
        abilitiesStatItem.setup(subititles: presenter.getAbilities(with: pokemonDetail))
        statusStatItem.setup(subititles: presenter.getStatus(with: pokemonDetail))
    }

}

extension PokemonDetailViewController {
    
    func configViews() {
        view.backgroundColor = .white
        removeBackButtonLabel()
    }
    
    func buildViews() {
        view.addSubview(habitatImage)
        view.addSubview(nameLabel)
        view.addSubview(pokemonImage)
        view.addSubview(statsStackView)
        
        statsStackView.addArrangedSubview(sizeStatItem)
        statsStackView.addArrangedSubview(statusStatItem)
        statsStackView.addArrangedSubview(abilitiesStatItem)
    }
    
    func buildConstraints() {
        habitatImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
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
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
