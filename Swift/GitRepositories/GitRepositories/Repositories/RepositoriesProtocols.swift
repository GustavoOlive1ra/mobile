import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol RepositoriesCoordinatorProtocol {
    func getRepository(repository: Repository)
}

// Presenter -> ViewController
internal protocol RepositoriesViewProtocol: AnyObject {
    func reload()
}

// ViewController -> Presenter
internal protocol RepositoriesPresenterProtocol: UITableViewDelegate, UITableViewDataSource {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol RepositoriesRepositoryInputProtocol {
    func getRepositories()
}

// Repository -> Presenter
internal protocol RepositoriesRepositoryOutputProtocol: AnyObject {
    func getRepositoriesSucess(with: [Repository])
    func getRepositoriesFailure(with: APIError)
}
