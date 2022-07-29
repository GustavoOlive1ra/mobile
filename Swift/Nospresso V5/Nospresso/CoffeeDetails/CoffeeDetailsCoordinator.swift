import UIKit

internal class CoffeeDetailsCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CoffeeDetailsCoordinator: CoffeeDetailsCoordinatorProtocol {
    
}

extension CoffeeDetailsCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, coffee: Coffee) -> UIViewController {
        let repository = CoffeeDetailsRepository()

        let coordinator = CoffeeDetailsCoordinator(navigationController: navigationController)
        
        let presenter = CoffeeDetailsPresenter(
            repository: repository,
            coordinator: coordinator,
            coffeeName: coffee.name,
            coffeeId: coffee.id
        )
        
        repository.output = presenter

        let viewController = CoffeeDetailsViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
