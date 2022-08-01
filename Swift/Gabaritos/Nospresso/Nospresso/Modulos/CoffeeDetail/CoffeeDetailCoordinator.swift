import UIKit

class CoffeeDetailCoordinator {
    
    weak private(set) var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CoffeeDetailCoordinator: CoffeeDetailCoordinatorProtocol {
    
}

extension CoffeeDetailCoordinator {
    
    class func createModule(using navigationController: UINavigationController?, and coffee: Cafe, delegate: FavoritesUpdateDelegate) -> UIViewController {
        let repository = CoffeeDetailRepository()

        let coordinator = CoffeeDetailCoordinator(navigationController: navigationController)
        
        let presenter = CoffeeDetailPresenter(
            repository: repository,
            coordinator: coordinator,
            delegate: delegate,
            coffeeName: coffee.nome,
            coffeeId: coffee.id
        )
        
        repository.output = presenter

        let viewController = CoffeeDetailViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
