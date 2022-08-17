import UIKit

internal class BattleViewController: UIViewController {

    private let presenter: BattlePresenterProtocol
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.pokemon_background()
        return imageView
    }()
    
    lazy var choicesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        return stack
    }()
    
    lazy var firstPokemonCard: CardPokemon = {
        let card = CardPokemon()
        return card
    }()
    
    lazy var secondPokemonCard: CardPokemon = {
        let card = CardPokemon()
        return card
    }()
    
    lazy var battleImage: UIImageView = {
        let image = UIImageView()
        image.image = Images.ic_battle()
        image.snp.makeConstraints { make in
            make.size.equalTo(50)
        }
        return image
    }()
    
    lazy var battleLogLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.battleLogTitle()
        label.textColor = .white
        return label
    }()
    
    lazy var battleLogTabel: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.layer.cornerRadius = 5
        tableView.backgroundColor = .white.withAlphaComponent(0.8)
        return tableView
    }()
    
    lazy var resultLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.isHidden = true
        return label
    }()

    internal init(presenter: BattlePresenterProtocol) {
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

// MARK: - BattleViewControllerProtocol
extension BattleViewController: BattleViewProtocol {
    
    func insertRowFirstOpponenet(index: Int) {
        let indexPaths = [IndexPath(row: index, section: 0)]
        battleLogTabel.insertRows(at: indexPaths, with: .left)
    }
    
    func insertRowSecondOpponenet(index: Int) {
        let indexPaths = [IndexPath(row: index, section: 0)]
        battleLogTabel.insertRows(at: indexPaths, with: .right)
    }
    
    func resultBattle(result: BattleStatus) {
        resultLabel.text = result.toText.uppercased()
        resultLabel.isHidden = false
        resultLabel.backgroundColor = result.color
    }
    
    func setupFirstOpponent(pokemon: PokemonDetail) {
        firstPokemonCard.setup(name: pokemon.name, id: String(pokemon.id))
    }
    
    func setupSecondOpponent(pokemon: PokemonDetail) {
        secondPokemonCard.setup(name: pokemon.name, id: String(pokemon.id))
    }
}

extension BattleViewController {
    
    func configViews() {
        removeBackButtonLabel()
        title = Strings.battleTitle()
        
        battleLogTabel.delegate = presenter
        battleLogTabel.dataSource = presenter
        battleLogTabel.register(BattleLogCell.self, forCellReuseIdentifier: BattleLogCell.reuseIdentifier.identifier)
    }
    
    func buildViews() {
        view.addSubview(backgroundImage)
        view.addSubview(choicesStack)
        view.addSubview(battleLogLabel)
        view.addSubview(battleLogTabel)
        view.addSubview(resultLabel)
        
        choicesStack.addArrangedSubview(firstPokemonCard)
        choicesStack.addArrangedSubview(battleImage)
        choicesStack.addArrangedSubview(secondPokemonCard)
    }
    
    func buildConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        choicesStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(25)
        }
        battleLogLabel.snp.makeConstraints { make in
            make.leading.equalTo(choicesStack)
            make.top.equalTo(choicesStack.snp.bottom).offset(15)
        }
        battleLogTabel.snp.makeConstraints { make in
            make.top.equalTo(battleLogLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(choicesStack)
        }
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(battleLogTabel.snp.bottom).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(30)
        }
    }
}
