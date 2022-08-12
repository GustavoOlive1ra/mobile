import Foundation

internal class BattlePresenter {

    internal weak var view: BattleViewProtocol?
    internal var repository: BattleRepositoryInputProtocol
    internal var coordinator: BattleCoordinatorProtocol
    
    private var firstOpponent: PokemonDetail
    private var secondOpponent: PokemonDetail
    
    internal init(repository: BattleRepositoryInputProtocol,
                  coordinator: BattleCoordinatorProtocol, firstOpponent: PokemonDetail, secondOpponent: PokemonDetail) {
        self.firstOpponent = firstOpponent
        self.secondOpponent = secondOpponent
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension BattlePresenter: BattlePresenterProtocol {

}
// MARK: - Repository Output
extension BattlePresenter: BattleRepositoryOutputProtocol {
    
}
