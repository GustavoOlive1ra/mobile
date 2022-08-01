import UIKit

class CoffeesPresenter: NSObject {
    
    weak var view: CoffeesViewProtocol?
    let repository: CoffeesRepositoryInputProtocol
    let coordinator: CoffeesCoordinatorProtocol
    
    private var coffeeCategories: [CategoriaCafe] = []
    
    private var lastSelectedIndexPath: IndexPath?
    
    init(repository: CoffeesRepositoryInputProtocol, coordinator: CoffeesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
}

extension CoffeesPresenter: CoffeesPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        repository.getCoffees()
    }
    
}

extension CoffeesPresenter: CoffeesRepositoryOutputProtocol {
    
    func getCoffeesSuccess(with coffeeCategories: [CategoriaCafe]) {
        self.coffeeCategories = coffeeCategories
        view?.reload()
        view?.hideLoadingIndicator()
    }
    
    func getCoffeesFailure(with error: ErroEmRequisicao) {
        view?.hideLoadingIndicator() { [weak self] in
            self?.view?.showAlert(title: Strings.error(), message: error.localizedDescription)
        }
    }
    
}

extension CoffeesPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeViewCell.reuseIdentifier, for: indexPath)!
        let coffee = coffeeCategories[indexPath.section].capsulas[indexPath.row]
        
        cell.setup(with: coffee)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coffeeCategories[section].capsulas.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        coffeeCategories.count
    }
    
}

extension CoffeesPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let category = coffeeCategories[section]
        
        let header = CategoryHeaderView()
        header.setup(with: category.nome)
                
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastSelectedIndexPath = indexPath
        let coffee = coffeeCategories[indexPath.section].capsulas[indexPath.row]
        
        coordinator.goToCoffeeDetail(of: coffee, delegate: self)
    }
    
}

extension CoffeesPresenter: FavoritesUpdateDelegate {
    
    func favoritesUpdated() {
        view?.reload()
        
        // MELHORIA
//        if let indexPath = lastSelectedIndexPath {
//            view?.reload(at: indexPath)
//        }
    }
    
}
