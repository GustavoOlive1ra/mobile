import Foundation

internal class PokemonDetailPresenter {

    internal weak var view: PokemonDetailViewProtocol?
    internal var repository: PokemonDetailRepositoryInputProtocol
    internal var coordinator: PokemonDetailCoordinatorProtocol
    
    private let pokemonName: String
    private var pokemonDetail: PokemonDetail?
    private var pokemonSpecies: PokemonSpecies?
    
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
    
    func getSizes(with pokemon: PokemonDetail) -> [String] {
        return ["Height: \(pokemon.height)", "Weight: \(pokemon.weight)"]
    }
    
    func getAbilities(with pokemon: PokemonDetail) -> [String] {
        return pokemon.abilities.map { ability in
            ability.ability.name
        }
    }
    
    func getStatus(with pokemon: PokemonDetail) -> [String] {
        return pokemon.status.map { status in
            return "\(status.stats.name): \(status.value)"
        }
    }

}
// MARK: - Repository Output
extension PokemonDetailPresenter: PokemonDetailRepositoryOutputProtocol {
    func getPokemonsSpeciesSuccess(with data: PokemonSpecies) {
        pokemonSpecies = data
        
        DispatchQueue.main.async {
            self.view?.setup(with: data)
        }
    }
    
    func getPokemonsSpeciesFailure(with error: APIError) {
    
    }
    
    func getPokemonsDetailSuccess(with data: PokemonDetail) {
        pokemonDetail = data
        
        DispatchQueue.main.async {
            self.view?.setup(with: data)
        }
    }
    
    func getPokemonsDetailFailure(with error: APIError) {
        
    }
    
    
}
