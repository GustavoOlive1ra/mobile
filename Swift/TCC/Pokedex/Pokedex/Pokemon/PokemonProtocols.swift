import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol PokemonCoordinatorProtocol {
    func openPokemonDetail(using pokemon: PokemonBase)
}

// Presenter -> ViewController
internal protocol PokemonViewProtocol: AnyObject {
    func reload()
    func showAlert(title: String, message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

// ViewController -> Presenter
internal protocol PokemonPresenterProtocol: UICollectionViewDataSource {
    func viewDidLoad()
    func touchedCollectionView(index: Int)
}

// Presenter -> Repository
internal protocol PokemonRepositoryInputProtocol {
    func getPokemonsBase()
}

// Repository -> Presenter
internal protocol PokemonRepositoryOutputProtocol: AnyObject {
    func getPokemonsSuccess(with data: [PokemonBase])
    func getPokemonsFailure(with error: APIError)
}
