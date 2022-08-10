import Foundation

// Presenter -> Coordinator
internal protocol PokemonDetailCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol PokemonDetailViewProtocol: AnyObject {
    func setup(with: PokemonDetail)
    func setup(with: PokemonSpecies)
}

// ViewController -> Presenter
internal protocol PokemonDetailPresenterProtocol {
    func viewDidLoad()
    func getSizes(with pokemon: PokemonDetail) -> [String]
    func getAbilities(with pokemon: PokemonDetail) -> [String]
    func getStatus(with pokemon: PokemonDetail) -> [String]
}

// Presenter -> Repository
internal protocol PokemonDetailRepositoryInputProtocol {
    func getPokemonsDetail(pokemonName: String)
    func getPokemonsSpecies(pokemonName: String)
}

// Repository -> Presenter
internal protocol PokemonDetailRepositoryOutputProtocol: AnyObject {
    func getPokemonsDetailSuccess(with data: PokemonDetail)
    func getPokemonsDetailFailure(with error: APIError)
    func getPokemonsSpeciesSuccess(with data: PokemonSpecies)
    func getPokemonsSpeciesFailure(with error: APIError)
}
