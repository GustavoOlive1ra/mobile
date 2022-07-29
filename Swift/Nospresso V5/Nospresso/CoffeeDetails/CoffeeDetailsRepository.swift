import Foundation

internal class CoffeeDetailsRepository {

    internal weak var output: CoffeeDetailsRepositoryOutputProtocol?
    private let api = API()
}

// MARK: - Repository Input
extension CoffeeDetailsRepository: CoffeeDetailsRepositoryInputProtocol {
    
    func getCoffeeDetails(with id: Int) {
        api.request(endpoint: .coffees(id: id)) { [weak self] (coffeeDetails: CoffeeDetails) in
            self?.output?.getCoffeeDetailsSuccess(with: coffeeDetails)
        } failure: { [weak self] error in
            self?.output?.getCoffeeDetailsFailure(with: error)
        }
    }
    
}
