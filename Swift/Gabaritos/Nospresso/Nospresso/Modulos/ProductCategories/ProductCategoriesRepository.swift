import Foundation

class ProductCategoriesRepository {

    weak var output: ProductCategoriesRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension ProductCategoriesRepository: ProductCategoriesRepositoryInputProtocol {

}
