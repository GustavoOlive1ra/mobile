import UIKit

class Favorites {
    
    static let shared = Favorites()
    
    private let userDefaults = UserDefaults.standard
    
    private let dataBaseKey = "NospressoFavoritos"
    
    var items: [Favorite] = []
    
    private init() {
        fetchFromDatabase()
    }
    
    func toggle(product: Produto) -> Bool {
        defer {
            updateDatabase()
        }
        
        let favorite = Favorite(product: product)
        
        if let indexOfFoundFavorite = items.firstIndex(of: favorite) {
            items.remove(at: indexOfFoundFavorite)
            return false
        } else {
            items.append(favorite)
            return true
        }
    }
    
    
    func remove(product: Produto) {
        if let indexOfFoundFavorite = items.firstIndex(of: .init(product: product)) {
            items.remove(at: indexOfFoundFavorite)
        }
        
        updateDatabase()
    }
    
    func isAFavorite(productId: Int) -> Bool {
        items.contains { $0.id == productId }
    }
    
}

private extension Favorites {
    func updateDatabase() {
        guard let jsonData =  try? JSONEncoder().encode(items) else { return }
        
        userDefaults.setValue(jsonData, forKey: dataBaseKey)
    }
    
    func fetchFromDatabase() {
        guard
            let jsonData = userDefaults.data(forKey: dataBaseKey),
            let data = try? JSONDecoder().decode([Favorite].self, from: jsonData)
        else { return }
        
        self.items = data
    }
}

protocol FavoritesUpdateDelegate: AnyObject {
    func favoritesUpdated()
}

extension UIImage {
    static var heartFill: UIImage? { UIImage(systemName: "heart.fill") }
    static var heart: UIImage? { UIImage(systemName: "heart") }
}
