import Foundation

// Presenter -> Coordinator
internal protocol PokemonDetailCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol PokemonDetailViewProtocol: AnyObject {

}

// ViewController -> Presenter
internal protocol PokemonDetailPresenterProtocol {

}

// Presenter -> Repository
internal protocol PokemonDetailRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol PokemonDetailRepositoryOutputProtocol: AnyObject {
    
}
