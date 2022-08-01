import UIKit

class MachinesPresenter: NSObject {
    
    weak var view: MachinesViewProtocol?
    let repository: MachinesRepositoryInputProtocol
    let coordinator: MachinesCoordinatorProtocol
    
    private var machines: [Maquina] = []
    
    init(repository: MachinesRepositoryInputProtocol, coordinator: MachinesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
}

extension MachinesPresenter: MachinesPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        repository.getMachines()
    }
    
}

extension MachinesPresenter: MachinesRepositoryOutputProtocol {
    
    func getMachinesSuccess(with data: [Maquina]) {
        machines = data
        view?.hideLoadingIndicator()
        view?.reload()
    }
    
    func getMachinesFailure(with error: ErroEmRequisicao) {
        view?.hideLoadingIndicator { [weak self] in
            self?.view?.showAlert(title: Strings.error(), message: error.localizedDescription)
        }
    }
    
}

extension MachinesPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        machines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MachineViewCell.reuseIdentifier, for: indexPath)!
        cell.setup(with: machines[indexPath.row])
        return cell
    }
    
}
