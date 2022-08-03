import Foundation

internal class PokemonPresenter {

    internal weak var view: PokemonViewProtocol?
    internal var repository: PokemonRepositoryInputProtocol
    internal var coordinator: PokemonCoordinatorProtocol
    
    internal init(repository: PokemonRepositoryInputProtocol,
                  coordinator: PokemonCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension PokemonPresenter: PokemonPresenterProtocol {

}
// MARK: - Repository Output
extension PokemonPresenter: PokemonRepositoryOutputProtocol {
    
}
