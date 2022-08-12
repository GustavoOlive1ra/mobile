import UIKit

internal class BattleCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension BattleCoordinator: BattleCoordinatorProtocol {
    
}

extension BattleCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, firstOpponent: PokemonDetail,
                                     secondOpponent: PokemonDetail) -> UIViewController {
        let repository = BattleRepository()

        let coordinator = BattleCoordinator(navigationController: navigationController)
        
        let presenter = BattlePresenter(
            repository: repository,
            coordinator: coordinator,
            firstOpponent: firstOpponent,
            secondOpponent: secondOpponent)
        
        repository.output = presenter

        let viewController = BattleViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
