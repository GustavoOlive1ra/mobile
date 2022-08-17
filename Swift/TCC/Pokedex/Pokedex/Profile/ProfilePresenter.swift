import Foundation
import UIKit

internal class ProfilePresenter {

    internal weak var view: ProfileViewProtocol?
    internal var repository: ProfileRepositoryInputProtocol
    internal var coordinator: ProfileCoordinatorProtocol
    
    internal init(repository: ProfileRepositoryInputProtocol,
                  coordinator: ProfileCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protoco∫l
extension ProfilePresenter: ProfilePresenterProtocol {
    func setName(name: String?) -> String? {
        let newName = name ?? " "
        Profiles.shared.update(name: newName)
        return Profiles.shared.getProfile().name
    }
    
    func viewDidLoad() {
        let profile = Profiles.shared.getProfile()
        let qtdUnlocked = UnloackedPokemon.shared.count()
        let qtdFavorite = Favorites.shared.count()
        DispatchQueue.main.async {
            self.view?.setup(profile: profile)
            self.view?.setup(qtdUnloacked: qtdUnlocked, qtdFavorite: qtdFavorite)
        }
    }
    
    func setGaleryImage(image: UIImage?) {
        guard let image = image else { return }
        Profiles.shared.update(image: image)
        viewDidLoad()
    }
    

}
// MARK: - Repository Output
extension ProfilePresenter: ProfileRepositoryOutputProtocol {
    
}
