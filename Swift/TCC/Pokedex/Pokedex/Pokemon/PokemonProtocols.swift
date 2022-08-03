import Foundation

// Presenter -> Coordinator
internal protocol PokemonCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol PokemonViewProtocol: AnyObject {

}

// ViewController -> Presenter
internal protocol PokemonPresenterProtocol {

}

// Presenter -> Repository
internal protocol PokemonRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol PokemonRepositoryOutputProtocol: AnyObject {
    
}
