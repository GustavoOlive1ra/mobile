import Foundation

internal class RepositoryDetailPresenter {

    internal weak var view: RepositoryDetailViewProtocol?
    internal var repository: RepositoryDetailRepositoryInputProtocol
    internal var coordinator: RepositoryDetailCoordinatorProtocol
    
    var repositoryName: String
    
    internal init(repository: RepositoryDetailRepositoryInputProtocol,
                  coordinator: RepositoryDetailCoordinatorProtocol,
                  repositoryName: String) {
        self.repository = repository
        self.coordinator = coordinator
        self.repositoryName = repositoryName
    }
}

// MARK: - Presenter Protocol
extension RepositoryDetailPresenter: RepositoryDetailPresenterProtocol {

}
// MARK: - Repository Output
extension RepositoryDetailPresenter: RepositoryDetailRepositoryOutputProtocol {
    
}
