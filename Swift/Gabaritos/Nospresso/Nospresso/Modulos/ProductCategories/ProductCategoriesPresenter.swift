import Foundation
import UIKit

class ProductCategoriesPresenter {
    
    weak var view: ProductCategoriesViewProtocol?
    let repository: ProductCategoriesRepositoryInputProtocol
    let coordinator: ProductCategoriesCoordinatorProtocol

    init(repository: ProductCategoriesRepositoryInputProtocol, coordinator: ProductCategoriesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
}

// MARK: - Presenter Protocol
extension ProductCategoriesPresenter: ProductCategoriesPresenterProtocol {
    
    func coffeesCategoryTouched() {
        coordinator.goToCoffees()
    }
    
    func machinesCategoryTouched() {
        coordinator.goToMachines()
    }
    
    func accessoriesCategoryTouched() {
        coordinator.goToAccessories()
    }

}

// MARK: - Repository Output
extension ProductCategoriesPresenter: ProductCategoriesRepositoryOutputProtocol {
    
}
