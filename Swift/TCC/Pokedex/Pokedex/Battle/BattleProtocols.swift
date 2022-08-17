import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol BattleCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol BattleViewProtocol: AnyObject {
    func setupFirstOpponent(pokemon: PokemonDetail)
    func setupSecondOpponent(pokemon: PokemonDetail)
    func resultBattle(result: BattleStatus)
    func insertRowFirstOpponenet(index: Int)
    func insertRowSecondOpponenet(index: Int)
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
