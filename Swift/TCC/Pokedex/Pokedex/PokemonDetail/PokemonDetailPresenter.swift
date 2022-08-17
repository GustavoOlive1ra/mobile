import Foundation

internal class PokemonDetailPresenter {

    internal weak var view: PokemonDetailViewProtocol?
    internal var repository: PokemonDetailRepositoryInputProtocol
    internal var coordinator: PokemonDetailCoordinatorProtocol
    
    private let pokemonName: String
    private var pokemonDetail: PokemonDetail?  {
        didSet{
            if pokemonSpecies != nil {
                view?.hideLoadingIndicator()
            }
        }
    }
    private var pokemonSpecies: PokemonSpecies?  {
        didSet{
            if pokemonDetail != nil {
                view?.hideLoadingIndicator()
            }
        }
    }
    
    internal init(repository: PokemonDetailRepositoryInputProtocol,
                  coordinator: PokemonDetailCoordinatorProtocol, pokemonName: String) {
        self.repository = repository
        self.coordinator = coordinator
        self.pokemonName = pokemonName
    }
}

// MARK: - Presenter Protocol
extension PokemonDetailPresenter: PokemonDetailPresenterProtocol {
    func openBattleChoice() {
        coordinator.openBattleChoiceOpponent(pokemonDetail: pokemonDetail!)
    }
    
    func toggleFavorite() {
        Favorites.shared.toggle(name: pokemonName)
    }
    
    func isFavorite() -> Bool {
        return Favorites.shared.isAFavorite(name: pokemonName)
    }
    
    
    func getTextEntry(with pokemon: PokemonSpecies) -> String {
        guard let textEntry = pokemon.textEntry.first(where: { flavorText in
            flavorText.language.name == "en"
        })?.text.components(separatedBy: .newlines).joined() else { return ""}
        
        return textEntry
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
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
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Erro", message: error.description)
        }
    }
    
    func getPokemonsDetailSuccess(with data: PokemonDetail) {
        pokemonDetail = data
        
        DispatchQueue.main.async {
            self.view?.setup(with: data)
        }
    }
    
    func getPokemonsDetailFailure(with error: APIError) {
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Erro", message: error.description)
        }
    }
    
    
}
