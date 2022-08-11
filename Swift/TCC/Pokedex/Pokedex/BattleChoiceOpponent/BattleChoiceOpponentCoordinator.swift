import UIKit

internal class BattleChoiceOpponentCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension BattleChoiceOpponentCoordinator: BattleChoiceOpponentCoordinatorProtocol {
    
}

extension BattleChoiceOpponentCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = BattleChoiceOpponentRepository()

        let coordinator = BattleChoiceOpponentCoordinator(navigationController: navigationController)
        
        let presenter = BattleChoiceOpponentPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = BattleChoiceOpponentViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
