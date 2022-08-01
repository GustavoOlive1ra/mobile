//
//  ProductCategoriesCoordinator.swift
//  Nospresso
//
//  Created by Marvin on 27/06/22.
//

import UIKit

class ProductCategoriesCoordinator {
    
    weak private(set) var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension ProductCategoriesCoordinator: ProductCategoriesCoordinatorProtocol {
    
    func goToCoffees() {
        let viewController = CoffeesCoordinator.createModule(using: navigationController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToMachines() {
        let viewController = MachinesCoordinator.createModule(using: navigationController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToAccessories() {
        print("TODO: goToAccessories")
    }
    
}

extension ProductCategoriesCoordinator {
    
    class func createModule(using navigationController: UINavigationController?) -> UIViewController {
        let repository = ProductCategoriesRepository()

        let coordinator = ProductCategoriesCoordinator(navigationController: navigationController)
        
        let presenter = ProductCategoriesPresenter(repository: repository, coordinator: coordinator)
        
        repository.output = presenter

        let viewController = ProductCategoriesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}

