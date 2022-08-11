import UIKit

internal class BattleChoiceOpponentViewController: UIViewController {

    private let presenter: BattleChoiceOpponentPresenterProtocol

    internal init(presenter: BattleChoiceOpponentPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()        
    }

}

// MARK: - BattleChoiceOpponentViewControllerProtocol
extension BattleChoiceOpponentViewController: BattleChoiceOpponentViewProtocol {

}

extension BattleChoiceOpponentViewController {
    
    func configViews() {
        view.backgroundColor = .green
    }
    
    func buildViews() {
    }
    
    func buildConstraints() {
    }
}
