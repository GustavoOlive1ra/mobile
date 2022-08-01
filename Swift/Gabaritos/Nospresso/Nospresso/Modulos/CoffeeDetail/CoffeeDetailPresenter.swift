import UIKit

class CoffeeDetailPresenter: NSObject {
    
    weak var view: CoffeeDetailViewProtocol?
    private let repository: CoffeeDetailRepositoryInputProtocol
    private let coordinator: CoffeeDetailCoordinatorProtocol
    
    private weak var delegate: FavoritesUpdateDelegate?
    
    private let coffeeName: String
    private let coffeeId: Int
    
    private var coffeeDetail: Cafe?
    
    init(
        repository: CoffeeDetailRepositoryInputProtocol,
        coordinator: CoffeeDetailCoordinatorProtocol,
        delegate: FavoritesUpdateDelegate,
        coffeeName: String,
        coffeeId: Int
    ) {
        self.repository = repository
        self.coordinator = coordinator
        self.delegate = delegate
        self.coffeeName = coffeeName
        self.coffeeId = coffeeId
    }
    
}

extension CoffeeDetailPresenter: CoffeeDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        repository.getCoffeeDetail(for: coffeeId)
        view?.setupFavoriteButton(isAFavorite: Favorites.shared.isAFavorite(productId: coffeeId))
    }
    
    func addToFavoritesButtonTouched() {
        guard let coffee = coffeeDetail else { return }
        
        let isAFavorite = Favorites.shared.toggle(product: coffee as Produto)
        view?.setupFavoriteButton(isAFavorite: isAFavorite)
        delegate?.favoritesUpdated()
    }
    
    func addToCartButtonTouched() {
        guard let coffee = coffeeDetail else { return }
        view?.showLoadingIndicator()
        repository.addToCart(product: coffee.forCart)
    }
    
}

extension CoffeeDetailPresenter: CoffeeDetailRepositoryOutputProtocol {
    
    func getCoffeeDetailSucceeded(with coffeeDetail: Cafe) {
        self.coffeeDetail = coffeeDetail
        DispatchQueue.main.async {
            self.view?.setup(with: coffeeDetail)
            self.view?.hideLoadingIndicator()
        }
    }
    
    func getCoffeeDetailFailed(with error: ErroEmRequisicao) {
        view?.hideLoadingIndicator() { [weak self] in
            self?.view?.showAlert(title: Strings.error(), message: error.localizedDescription)
        }
    }
    
    func addToCartSucceeded() {
        view?.hideLoadingIndicator() { [weak self] in
            self?.view?.showAlert(title: Strings.coffeeAddToCartSuccessAlertTitle(), message: Strings.coffeeAddToCartSuccessAlertMessage(self?.coffeeName ?? ""))
        }
        
    }
    
    func addToCartFailed(with error: ErroEmRequisicao) {
        view?.hideLoadingIndicator() { [weak self] in
            self?.view?.showAlert(title: Strings.error(), message: error.localizedDescription)
        }
    }
    
}
