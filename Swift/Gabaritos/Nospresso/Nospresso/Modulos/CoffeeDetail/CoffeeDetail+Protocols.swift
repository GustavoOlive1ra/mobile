import Foundation

// Presenter -> Coordinator
protocol CoffeeDetailCoordinatorProtocol {
    
}

// Presenter -> ViewController
protocol CoffeeDetailViewProtocol: AnyObject {
    func setup(with coffee: Cafe)
    func setupFavoriteButton(isAFavorite: Bool)
    func showAlert(title: String, message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showLoadingIndicator(completion: (() -> Void)?)
    func hideLoadingIndicator(completion: (() -> Void)?)
}

// ViewController -> Presenter
protocol CoffeeDetailPresenterProtocol {
    func viewDidLoad()
    func addToFavoritesButtonTouched()
    func addToCartButtonTouched()
}

// Presenter -> Repository
protocol CoffeeDetailRepositoryInputProtocol {
    func getCoffeeDetail(for id: Int)
    func addToCart(product: ProdutoSacola)
}

// Repository -> Presenter
protocol CoffeeDetailRepositoryOutputProtocol: AnyObject {
    func getCoffeeDetailSucceeded(with coffeeDetail: Cafe)
    func getCoffeeDetailFailed(with error: ErroEmRequisicao)
    func addToCartSucceeded()
    func addToCartFailed(with error: ErroEmRequisicao)
}
