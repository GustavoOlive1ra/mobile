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
        navigationController?.removeBackButtonLabel()
    }

}

// MARK: - PokemonDetailViewControllerProtocol
extension PokemonDetailViewController: PokemonDetailViewProtocol {

}

extension PokemonDetailViewController {
    func configViews() {
        view.backgroundColor = .white
    }
    
    func buildViews() {
    }
    
    func buildConstraints() {
    }
}

