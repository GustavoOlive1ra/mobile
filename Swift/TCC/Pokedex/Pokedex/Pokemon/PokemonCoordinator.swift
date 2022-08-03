import UIKit

internal class PokemonCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension PokemonCoordinator: PokemonCoordinatorProtocol {
    
}

extension PokemonCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = PokemonRepository()

        let coordinator = PokemonCoordinator(navigationController: navigationController)
        
        let presenter = PokemonPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = PokemonViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
