import UIKit

internal class BattleChoiceOpponentCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension BattleChoiceOpponentCoordinator: BattleChoiceOpponentCoordinatorProtocol {
    func openBattle(with first: PokemonDetail, and second: PokemonDetail) {
        let viewController = BattleCoordinator.createModule(navigationController: navigationController, firstOpponent: first, secondOpponent: second)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

extension BattleChoiceOpponentCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, pokemonDetail: PokemonDetail) -> UIViewController {
        let repository = BattleChoiceOpponentRepository()

        let coordinator = BattleChoiceOpponentCoordinator(navigationController: navigationController)
        
        let presenter = BattleChoiceOpponentPresenter(
            repository: repository,
            coordinator: coordinator, pokemonDetail: pokemonDetail)
        
        repository.output = presenter

        let viewController = BattleChoiceOpponentViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
