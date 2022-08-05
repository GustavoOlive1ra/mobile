import Foundation

internal class PokemonRepository {

    internal weak var output: PokemonRepositoryOutputProtocol?
    let api = API()

}

// MARK: - Repository Input
extension PokemonRepository: PokemonRepositoryInputProtocol {
    func getPokemonsBase() {
        api.request(endpoint: .pokemonBaseList(), success: {[weak self] (PokemonBasePegeable: PokemonBasePegeable) in
            self?.output?.getPokemonsSuccess(with: PokemonBasePegeable.pokemons)
        }, failure: { [weak self] error in
            self?.output?.getPokemonsFailure(with: error)
        })
    }
    
}
