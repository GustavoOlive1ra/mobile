import Foundation
import UIKit

internal class BattleChoiceOpponentPresenter: NSObject {

    internal weak var view: BattleChoiceOpponentViewProtocol?
    internal var repository: BattleChoiceOpponentRepositoryInputProtocol
    internal var coordinator: BattleChoiceOpponentCoordinatorProtocol
    
    private var firstOpponent: PokemonDetail
    
    var pokemonsBaseUnloaked: [PokemonBase] = []
    
    internal init(repository: BattleChoiceOpponentRepositoryInputProtocol,
                  coordinator: BattleChoiceOpponentCoordinatorProtocol, pokemonDetail: PokemonDetail) {
        self.firstOpponent = pokemonDetail
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension BattleChoiceOpponentPresenter: BattleChoiceOpponentPresenterProtocol {
    func touchedCollectionView(index: Int) {
        repository.getSecondOpponent(pokemonName: pokemonsBaseUnloaked[index].name)
    }
    
    func viewDidLoad() {
        view?.setupFirstOpponent(with: firstOpponent)
        let pokemonsFilter = UnloackedPokemon.shared.filterItems(withOut: firstOpponent.name)
        pokemonsBaseUnloaked = pokemonsFilter.map({ unloacked in
            PokemonBase(name: unloacked.name, url: unloacked.url)
        })
        view?.reload()
    }
}
// MARK: - Repository Output
extension BattleChoiceOpponentPresenter: BattleChoiceOpponentRepositoryOutputProtocol {
    func getSecondOpponentSuccess(with data: PokemonDetail) {
        DispatchQueue.main.async {
            self.coordinator.openBattle(with: self.firstOpponent, and: data)
        }
    }
    
    func getSecondOpponentDetailFailure(with error: APIError) {
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Erro", message: error.description)
        }
    }
    
    
}

extension BattleChoiceOpponentPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemonsBaseUnloaked.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPokemonCell.reuseIdentifier, for: indexPath)!
                
        cell.setup(with: pokemonsBaseUnloaked[indexPath.item], isUnloacked: true, isFavorite: false)
        
        return cell
    }
}
