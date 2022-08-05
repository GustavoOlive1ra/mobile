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

}

// MARK: - PokemonDetailViewControllerProtocol
extension PokemonDetailViewController: PokemonDetailViewProtocol {

}
