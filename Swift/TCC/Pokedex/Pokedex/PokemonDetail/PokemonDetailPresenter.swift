import Foundation

internal class PokemonDetailPresenter {

    internal weak var view: PokemonDetailViewProtocol?
    internal var repository: PokemonDetailRepositoryInputProtocol
    internal var coordinator: PokemonDetailCoordinatorProtocol
    
    internal init(repository: PokemonDetailRepositoryInputProtocol,
                  coordinator: PokemonDetailCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension PokemonDetailPresenter: PokemonDetailPresenterProtocol {

}
// MARK: - Repository Output
extension PokemonDetailPresenter: PokemonDetailRepositoryOutputProtocol {
    
}
