import Foundation

internal class CoffeeDetailsPresenter {

    internal weak var view: CoffeeDetailsViewProtocol?
    internal var repository: CoffeeDetailsRepositoryInputProtocol
    internal var coordinator: CoffeeDetailsCoordinatorProtocol
    
    private let coffeeName: String
    private let coffeeId: Int
    
    internal init(
        repository: CoffeeDetailsRepositoryInputProtocol,
        coordinator: CoffeeDetailsCoordinatorProtocol,
        coffeeName: String,
        coffeeId: Int
    ) {
        self.repository = repository
        self.coordinator = coordinator
        self.coffeeName = coffeeName
        self.coffeeId = coffeeId
    }
}

// MARK: - Presenter Protocol
extension CoffeeDetailsPresenter: CoffeeDetailsPresenterProtocol {
    
    func viewDidLoad() {
        view?.setup(name: coffeeName)
        
        view?.showLoadingIndicator()
        repository.getCoffeeDetails(with: coffeeId)
    }

}

// MARK: - Repository Output
extension CoffeeDetailsPresenter: CoffeeDetailsRepositoryOutputProtocol {
    
    func getCoffeeDetailsSuccess(with coffeeDetails: CoffeeDetails) {
        view?.hideLoadingIndicator()
        view?.setup(with: coffeeDetails)
    }
    
    func getCoffeeDetailsFailure(with error: APIError) {
        view?.hideLoadingIndicator()
        view?.showAlert(title: "Erro", message: error.localizedDescription)
    }
    
    
}
