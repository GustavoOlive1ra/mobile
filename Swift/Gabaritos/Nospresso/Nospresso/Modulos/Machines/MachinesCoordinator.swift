import UIKit

class MachinesCoordinator {
    
    weak private(set) var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension MachinesCoordinator: MachinesCoordinatorProtocol {
    
}

extension MachinesCoordinator {
    
    class func createModule(using navigationController: UINavigationController?) -> UIViewController {
        let repository = MachinesRepository()

        let coordinator = MachinesCoordinator(navigationController: navigationController)
        
        let presenter = MachinesPresenter(repository: repository, coordinator: coordinator)
        
        repository.output = presenter

        let viewController = MachinesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
