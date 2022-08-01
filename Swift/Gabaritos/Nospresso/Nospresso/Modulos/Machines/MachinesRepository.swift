import Foundation

class MachinesRepository {
    
    private let api = API()

    weak var output: MachinesRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension MachinesRepository: MachinesRepositoryInputProtocol {
    
    func getMachines() {
        api.requisitar(endpoint: .maquinas) { [weak self] (machines: [Maquina]) in
            self?.output?.getMachinesSuccess(with: machines)
        } falha: { [weak self] error in
            self?.output?.getMachinesFailure(with: error)
            print(error)
        }
    }
    
}
