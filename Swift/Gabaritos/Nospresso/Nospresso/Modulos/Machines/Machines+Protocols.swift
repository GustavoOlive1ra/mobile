import UIKit

// Presenter -> Coordinator
protocol MachinesCoordinatorProtocol {
    
}

// Presenter -> ViewController
protocol MachinesViewProtocol: AnyObject {
    func reload()
    func showAlert(title: String, message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showLoadingIndicator(completion: (() -> Void)?)
    func hideLoadingIndicator(completion: (() -> Void)?)
}

// ViewController -> Presenter
protocol MachinesPresenterProtocol: UICollectionViewDataSource {
    func viewDidLoad()
}

// Presenter -> Repository
protocol MachinesRepositoryInputProtocol {
    func getMachines()
}

// Repository -> Presenter
protocol MachinesRepositoryOutputProtocol: AnyObject {
    func getMachinesSuccess(with data: [Maquina])
    func getMachinesFailure(with error: ErroEmRequisicao)
}
