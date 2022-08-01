import Foundation

// Presenter -> Coordinator
protocol ProductCategoriesCoordinatorProtocol {
    func goToCoffees()
    func goToMachines()
    func goToAccessories()
}

// Presenter -> ViewController
protocol ProductCategoriesViewProtocol: AnyObject {
    
}

// ViewController -> Presenter
protocol ProductCategoriesPresenterProtocol {
    func coffeesCategoryTouched()
    func machinesCategoryTouched()
    func accessoriesCategoryTouched()
}

// Presenter -> Repository
protocol ProductCategoriesRepositoryInputProtocol {
    
}

// Repository -> Presenter
protocol ProductCategoriesRepositoryOutputProtocol: AnyObject {
    
}

