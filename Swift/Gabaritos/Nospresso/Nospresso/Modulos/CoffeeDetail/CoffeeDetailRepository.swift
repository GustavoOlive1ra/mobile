import Foundation

class CoffeeDetailRepository {
    
    private let api = API()

    weak var output: CoffeeDetailRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension CoffeeDetailRepository: CoffeeDetailRepositoryInputProtocol {
    
    func getCoffeeDetail(for id: Int) {
        api.requisitar(endpoint: .cafe(id: id)) { [weak self] (coffeeDetail: Cafe) in
            self?.output?.getCoffeeDetailSucceeded(with: coffeeDetail)
        } falha: { [weak self] error in
            self?.output?.getCoffeeDetailFailed(with: error)
        }
    }
    
    func addToCart(product: ProdutoSacola) {
        api.requisitar(endpoint: .sacola, metodo: .post, objeto: product) { [weak self] (result: ProdutoSacola) in
            self?.output?.addToCartSucceeded()
        } falha: { [weak self] error in
            self?.output?.addToCartFailed(with: error)
            print(error)
        }
    }
    
}
