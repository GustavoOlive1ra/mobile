import Foundation

internal class PokemonRepository {

    internal weak var output: PokemonRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension PokemonRepository: PokemonRepositoryInputProtocol {

}
