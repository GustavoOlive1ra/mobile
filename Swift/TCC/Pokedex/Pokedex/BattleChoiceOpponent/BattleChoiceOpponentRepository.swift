import Foundation

internal class BattleChoiceOpponentRepository {

    internal weak var output: BattleChoiceOpponentRepositoryOutputProtocol?
    let api = API()
}

// MARK: - Repository Input
extension BattleChoiceOpponentRepository: BattleChoiceOpponentRepositoryInputProtocol {
    func getSecondOpponent(pokemonName: String) {
        api.request(endpoint: .pokemonDetail(name: pokemonName)) {[weak self] (pokemonDetail: PokemonDetail) in
            self?.output?.getSecondOpponentSuccess(with: pokemonDetail)
        } failure: { [weak self] error in
            self?.output?.getSecondOpponentDetailFailure(with: error)
        }
    }
}
