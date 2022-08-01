import UIKit

class FavoritesCoordinator {
    
    weak private(set) var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension FavoritesCoordinator: FavoritesCoordinatorProtocol {
    
}

extension FavoritesCoordinator {
    
    class func createModule(using navigationController: UINavigationController?) -> UIViewController {
        let repository = FavoritesRepository()

        let coordinator = FavoritesCoordinator(navigationController: navigationController)
        
        let presenter = FavoritesPresenter(
            repository: repository,
            coordinator: coordinator
        )
        
        repository.output = presenter

        let viewController = FavoritesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
