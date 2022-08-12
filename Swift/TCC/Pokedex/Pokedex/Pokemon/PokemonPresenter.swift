import Foundation
import UIKit

internal class PokemonPresenter: NSObject {

    internal weak var view: PokemonViewProtocol?
    internal var repository: PokemonRepositoryInputProtocol
    internal var coordinator: PokemonCoordinatorProtocol
    
    var pokemonBase: [PokemonBase] = []
    
    internal init(repository: PokemonRepositoryInputProtocol,
                  coordinator: PokemonCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension PokemonPresenter: PokemonPresenterProtocol {
    
    func touchedCollectionView(index: Int) {
        coordinator.openPokemonDetail(using: pokemonBase[index])
        UnloackedPokemon.shared.add(pokemonName: pokemonBase[index].name, url: pokemonBase[index].url)
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        repository.getPokemonsBase()
    }

}
// MARK: - Repository Output
extension PokemonPresenter: PokemonRepositoryOutputProtocol {
    func getPokemonsSuccess(with data: [PokemonBase]) {
        pokemonBase = data
        
        DispatchQueue.main.async {
            self.view?.reload()
            self.view?.hideLoadingIndicator()
        }
    }
    
    func getPokemonsFailure(with error: APIError) {
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Erro", message: error.description)
        }
    }
}

extension PokemonPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemonBase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPokemonCell.reuseIdentifier, for: indexPath)!
        
        let isUnlocked = UnloackedPokemon.shared.isUnloacked(pokemonName: pokemonBase[indexPath.item].name)
        let isFavorite = Favorites.shared.isAFavorite(name: pokemonBase[indexPath.item].name)
        
        cell.setup(with: pokemonBase[indexPath.item], isUnloacked: isUnlocked, isFavorite: isFavorite)
        
        return cell
    }
}
