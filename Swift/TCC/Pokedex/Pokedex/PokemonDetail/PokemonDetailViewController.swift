import UIKit

internal class PokemonDetailViewController: UIViewController {

    private let presenter: PokemonDetailPresenterProtocol
    

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
    func setup(with: PokemonSpecies) {
        
    }
    
    func setup(with pokemonDetail: PokemonDetail) {
        title = pokemonDetail.name.uppercased()
    }

}

extension PokemonDetailViewController {
    func configViews() {
        view.backgroundColor = .white
        removeBackButtonLabel()
    }
    
    func buildViews() {
    }
    
    func buildConstraints() {
    }
}

