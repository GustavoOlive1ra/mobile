import UIKit

internal class BattleViewController: UIViewController {

    private let presenter: BattlePresenterProtocol

    internal init(presenter: BattlePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - BattleViewControllerProtocol
extension BattleViewController: BattleViewProtocol {

}
