import UIKit

internal class PokemonViewController: UIViewController {

    private let presenter: PokemonPresenterProtocol

    internal init(presenter: PokemonPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - PokemonViewControllerProtocol
extension PokemonViewController: PokemonViewProtocol {

}
