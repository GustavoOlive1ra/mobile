import Foundation

internal class RepositoriesRepository {

    internal weak var output: RepositoriesRepositoryOutputProtocol?
}

// MARK: - Repository Input
extension RepositoriesRepository: RepositoriesRepositoryInputProtocol {
    func getRepositories() {
        let url = SearchAPIURLProvider(endpoint: .search(language: "swift"))
        Requester.request(search: url) {[weak self] (result: Result<RepositoryPegeable, APIError>) in
            switch result {
            case .success(let repositoryPageable):
                self?.output?.getRepositoriesSucess(with: repositoryPageable.itens)
            case .failure(let error):
                self?.output?.getRepositoriesFailure(with: error)
            }
        }
    }
}
