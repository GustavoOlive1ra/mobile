import Foundation

internal class BattleChoiceOpponentPresenter {

    internal weak var view: BattleChoiceOpponentViewProtocol?
    internal var repository: BattleChoiceOpponentRepositoryInputProtocol
    internal var coordinator: BattleChoiceOpponentCoordinatorProtocol
    
    internal init(repository: BattleChoiceOpponentRepositoryInputProtocol,
                  coordinator: BattleChoiceOpponentCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension BattleChoiceOpponentPresenter: BattleChoiceOpponentPresenterProtocol {

}
// MARK: - Repository Output
extension BattleChoiceOpponentPresenter: BattleChoiceOpponentRepositoryOutputProtocol {
    
}
