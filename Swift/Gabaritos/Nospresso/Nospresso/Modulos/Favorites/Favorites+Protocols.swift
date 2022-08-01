import UIKit

// Presenter -> Coordinator
protocol FavoritesCoordinatorProtocol {
    
}

// Presenter -> ViewController
protocol FavoritesViewProtocol: AnyObject {
    func deleteRow(at indexPath: IndexPath)
    func reloadTableView()
    func showTableView()
    func showEmptyView()
}

// ViewController -> Presenter
protocol FavoritesPresenterProtocol: UITableViewDelegate, UITableViewDataSource {
    func viewWillAppear()
}

// Presenter -> Repository
protocol FavoritesRepositoryInputProtocol {
    func getFavorites()
    func remove(product: Produto)
}

// Repository -> Presenter
protocol FavoritesRepositoryOutputProtocol: AnyObject {
    func getFavoritesSucceeded(with data: [Produto])
    func removeSucceeded(with newData: [Produto])
}
