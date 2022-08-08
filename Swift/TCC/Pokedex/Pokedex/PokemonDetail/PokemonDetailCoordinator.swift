import UIKit

internal class PokemonDetailCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension PokemonDetailCoordinator: PokemonDetailCoordinatorProtocol {
    
}

extension PokemonDetailCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, pokemonName: String) -> UIViewController {
        
        
        let repository = PokemonDetailRepository()

        let coordinator = PokemonDetailCoordinator(navigationController: navigationController)
        
        let presenter = PokemonDetailPresenter(
            repository: repository,
            coordinator: coordinator,
            pokemonName: pokemonName)
        
        repository.output = presenter

        let viewController = PokemonDetailViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
