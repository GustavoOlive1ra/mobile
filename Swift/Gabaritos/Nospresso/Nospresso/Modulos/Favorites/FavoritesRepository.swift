import Foundation

class FavoritesRepository {

    weak var output: FavoritesRepositoryOutputProtocol?

}

extension FavoritesRepository: FavoritesRepositoryInputProtocol {
    
    func getFavorites() {
        output?.getFavoritesSucceeded(with: Favorites.shared.items)
    }
    
    func remove(product: Produto) {
        Favorites.shared.remove(product: product)
        output?.removeSucceeded(with: Favorites.shared.items)
    }
    
}
