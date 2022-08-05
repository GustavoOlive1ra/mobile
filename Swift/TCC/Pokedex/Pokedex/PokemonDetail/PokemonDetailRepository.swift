import Foundation

internal class PokemonDetailRepository {

    internal weak var output: PokemonDetailRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension PokemonDetailRepository: PokemonDetailRepositoryInputProtocol {

}
