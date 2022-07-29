import Foundation

// Presenter -> Coordinator
internal protocol CoffeeDetailsCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol CoffeeDetailsViewProtocol: AnyObject {
    func setup(name: String)
    func setup(with coffeeDetails: CoffeeDetails)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showAlert(title: String, message: String)
}

// ViewController -> Presenter
internal protocol CoffeeDetailsPresenterProtocol {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol CoffeeDetailsRepositoryInputProtocol {
    func getCoffeeDetails(with id: Int)
}

// Repository -> Presenter
internal protocol CoffeeDetailsRepositoryOutputProtocol: AnyObject {
    func getCoffeeDetailsSuccess(with coffeeDetails: CoffeeDetails)
    func getCoffeeDetailsFailure(with error: APIError)
}
