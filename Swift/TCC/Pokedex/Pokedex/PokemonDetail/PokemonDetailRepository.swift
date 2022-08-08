import Foundation
import UIKit

internal class PokemonDetailRepository {

    internal weak var output: PokemonDetailRepositoryOutputProtocol?
    let api = API()

}

// MARK: - Repository Input
extension PokemonDetailRepository: PokemonDetailRepositoryInputProtocol {
    func getPokemonsSpecies(pokemonName: String) {
        api.request(endpoint: .pokemonSpecies(name: pokemonName)) {[weak self] (pokemonSpecies: PokemonSpecies) in
            self?.output?.getPokemonsSpeciesSuccess(with: pokemonSpecies)
        } failure: { [weak self] error in
            self?.output?.getPokemonsSpeciesFailure(with: error)
        }
    }
    
    func getPokemonsDetail(pokemonName: String) {
        api.request(endpoint: .pokemonDetail(name: pokemonName)) {[weak self] (pokemonDetail: PokemonDetail) in
            self?.output?.getPokemonsDetailSuccess(with: pokemonDetail)
        } failure: { [weak self] error in
            self?.output?.getPokemonsDetailFailure(with: error)
        }
    }

}
