import UIKit

class FavoritesPresenter: NSObject {
    
    weak var view: FavoritesViewProtocol?
    private let repository: FavoritesRepositoryInputProtocol
    private let coordinator: FavoritesCoordinatorProtocol
    
    private var favorites: [Produto] = []
    
    init(
        repository: FavoritesRepositoryInputProtocol,
        coordinator: FavoritesCoordinatorProtocol
    ) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
    func updateView() {
        guard favorites.isEmpty else {
            view?.showTableView()
            return
        }
        
        view?.showEmptyView()
    }
    
}

extension FavoritesPresenter: FavoritesPresenterProtocol {
    
    func viewWillAppear() {
        repository.getFavorites()
    }
    
}

extension FavoritesPresenter: FavoritesRepositoryOutputProtocol {
    
    func getFavoritesSucceeded(with data: [Produto]) {
        favorites = data
        view?.reloadTableView()
        updateView()
    }
    
    func removeSucceeded(with newData: [Produto]) {
        favorites = newData
        updateView()
    }
    
}

extension FavoritesPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteViewCell.reuseIdentifier, for: indexPath)!
        let product = favorites[indexPath.row]
        
        cell.setup(with: product)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: Strings.remove()) { [weak self] (_, _, handler) in
            guard let product = self?.favorites[indexPath.row] else {
                handler(false)
                return
            }
            
            self?.repository.remove(product: product)
            self?.view?.deleteRow(at: indexPath)
            handler(true)
        }

        return UISwipeActionsConfiguration(actions: [action])
    }
    
    // TEMA: leading swipe action
    
}

extension FavoritesPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

}
