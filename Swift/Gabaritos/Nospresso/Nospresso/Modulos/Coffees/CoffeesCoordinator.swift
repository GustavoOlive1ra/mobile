import UIKit

class CoffeesCoordinator {
    
    weak private(set) var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CoffeesCoordinator: CoffeesCoordinatorProtocol {
    
    func goToCoffeeDetail(of coffee: Cafe, delegate: FavoritesUpdateDelegate) {
        let viewController = CoffeeDetailCoordinator.createModule(using: navigationController, and: coffee, delegate: delegate)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension CoffeesCoordinator {
    
    class func createModule(using navigationController: UINavigationController?) -> UIViewController {
        let repository = CoffeesRepository()

        let coordinator = CoffeesCoordinator(navigationController: navigationController)
        
        let presenter = CoffeesPresenter(repository: repository, coordinator: coordinator)
        
        repository.output = presenter

        let viewController = CoffeesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}


