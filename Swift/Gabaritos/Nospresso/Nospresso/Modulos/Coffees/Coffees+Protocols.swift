import UIKit

// Presenter -> Coordinator
protocol CoffeesCoordinatorProtocol {
    func goToCoffeeDetail(of coffee: Cafe, delegate: FavoritesUpdateDelegate)
}

// Presenter -> ViewController
protocol CoffeesViewProtocol: AnyObject {
    func reload()
    func reload(at indexPath: IndexPath)
    func showAlert(title: String, message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showLoadingIndicator(completion: (() -> Void)?)
    func hideLoadingIndicator(completion: (() -> Void)?)
}

// ViewController -> Presenter
protocol CoffeesPresenterProtocol: UITableViewDelegate, UITableViewDataSource {
    func viewDidLoad()
}

// Presenter -> Repository
protocol CoffeesRepositoryInputProtocol {
    func getCoffees()
}

// Repository -> Presenter
protocol CoffeesRepositoryOutputProtocol: AnyObject {
    func getCoffeesSuccess(with coffeeCategories: [CategoriaCafe])
    func getCoffeesFailure(with error: ErroEmRequisicao)
}
