import Foundation

// Presenter -> Coordinator
internal protocol BattleCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol BattleViewProtocol: AnyObject {

}

// ViewController -> Presenter
internal protocol BattlePresenterProtocol {

}

// Presenter -> Repository
internal protocol BattleRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol BattleRepositoryOutputProtocol: AnyObject {
    
}
