import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol BattleChoiceOpponentCoordinatorProtocol {
    func openBattle(with first: PokemonDetail, and second: PokemonDetail)
}

// Presenter -> ViewController
internal protocol BattleChoiceOpponentViewProtocol: AnyObject {
    func setupFirstOpponent(with pokemon: PokemonDetail)
    func reload()
    func showAlert(title: String, message: String)
}

// ViewController -> Presenter
internal protocol BattleChoiceOpponentPresenterProtocol: UICollectionViewDataSource {
    func viewDidLoad()
    func touchedCollectionView(index: Int)
}

// Presenter -> Repository
internal protocol BattleChoiceOpponentRepositoryInputProtocol {
    func getSecondOpponent(pokemonName: String)
}

// Repository -> Presenter
internal protocol BattleChoiceOpponentRepositoryOutputProtocol: AnyObject {
    func getSecondOpponentSuccess(with data: PokemonDetail)
    func getSecondOpponentDetailFailure(with error: APIError)
}
