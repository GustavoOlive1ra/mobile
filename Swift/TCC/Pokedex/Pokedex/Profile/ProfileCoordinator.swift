import UIKit

internal class ProfileCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension ProfileCoordinator: ProfileCoordinatorProtocol {
    
}

extension ProfileCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = ProfileRepository()

        let coordinator = ProfileCoordinator(navigationController: navigationController)
        
        let presenter = ProfilePresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = ProfileViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
