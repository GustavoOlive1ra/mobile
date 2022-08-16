import Foundation

internal class ProfileRepository {

    internal weak var output: ProfileRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension ProfileRepository: ProfileRepositoryInputProtocol {

}
