import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol BattleCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol BattleViewProtocol: AnyObject {
    func setupFirstOpponent(pokemon: PokemonDetail)
    func setupSecondOpponent(pokemon: PokemonDetail)
    func reloadData()
    func resultBattle(result: BattleStatus)
}

// ViewController -> Presenter
internal protocol BattlePresenterProtocol: UITableViewDelegate, UITableViewDataSource  {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol BattleRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol BattleRepositoryOutputProtocol: AnyObject {
    
}
