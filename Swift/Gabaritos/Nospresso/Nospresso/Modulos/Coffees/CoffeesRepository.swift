import Foundation

class CoffeesRepository {
    
    private let api = API()

    weak var output: CoffeesRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension CoffeesRepository: CoffeesRepositoryInputProtocol {
    
    func getCoffees() {
        api.requisitar(endpoint: .capsulas) { [weak self] (coffeeCategories: [CategoriaCafe]) in
            self?.output?.getCoffeesSuccess(with: coffeeCategories)
        } falha: { [weak self] error in
            self?.output?.getCoffeesFailure(with: error)
            print(error)
        }
    }
    
}
