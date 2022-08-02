import UIKit

internal class RepositoryDetailCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension RepositoryDetailCoordinator: RepositoryDetailCoordinatorProtocol {
    
}

extension RepositoryDetailCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, data: Repository) -> UIViewController {
        let repository = RepositoryDetailRepository()

        let coordinator = RepositoryDetailCoordinator(navigationController: navigationController)
        
        let presenter = RepositoryDetailPresenter(
            repository: repository,
            coordinator: coordinator, repositoryName: data.name)
        
        repository.output = presenter

        let viewController = RepositoryDetailViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
