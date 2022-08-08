import Foundation

internal class PokemonDetailPresenter {

    internal weak var view: PokemonDetailViewProtocol?
    internal var repository: PokemonDetailRepositoryInputProtocol
    internal var coordinator: PokemonDetailCoordinatorProtocol
    
    private let pokemonName: String
    
    internal init(repository: PokemonDetailRepositoryInputProtocol,
                  coordinator: PokemonDetailCoordinatorProtocol, pokemonName: String) {
        self.repository = repository
        self.coordinator = coordinator
        self.pokemonName = pokemonName
    }
}

// MARK: - Presenter Protocol
extension PokemonDetailPresenter: PokemonDetailPresenterProtocol {
    func viewDidLoad() {
        repository.getPokemonsDetail(pokemonName: pokemonName)
        repository.getPokemonsSpecies(pokemonName: pokemonName)
    }
    

}
// MARK: - Repository Output
extension PokemonDetailPresenter: PokemonDetailRepositoryOutputProtocol {
    func getPokemonsSpeciesSuccess(with data: PokemonSpecies) {
        print(data)
    }
    
    func getPokemonsSpeciesFailure(with error: APIError) {
    
    }
    
    func getPokemonsDetailSuccess(with data: PokemonDetail) {
        print(data)
    }
    
    func getPokemonsDetailFailure(with error: APIError) {
        
    }
    
    
}
