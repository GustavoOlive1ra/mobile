import UIKit

internal class RepositoryDetailViewController: UIViewController {

    private let presenter: RepositoryDetailPresenterProtocol

    internal init(presenter: RepositoryDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "name"
    }

}

// MARK: - RepositoryDetailViewControllerProtocol
extension RepositoryDetailViewController: RepositoryDetailViewProtocol {

}
