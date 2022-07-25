//
//  ProductCategoriesRepository.swift
//  Nospresso
//
//  Created by Treinamento on 21/07/22.
//

import Foundation

class ProductCategoriesRepository {
    
    var api: API = API()
    weak var output: ProductCategoriesRepositoryOutputProtocol?
    
}

extension ProductCategoriesRepository: ProductCategoriesRepositoryInputProtocol {
    func getMachine() {
        api.requestMachines {
            
        }
    }
    
    func getCapsule() {
        api.requestCapsule {
            
        }
    }
    
    
    func getCoffees() {
        api.request {
            
        }
    }
    
}
