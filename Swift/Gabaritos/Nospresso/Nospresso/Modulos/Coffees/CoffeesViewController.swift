import UIKit

class CoffeesViewController: UIViewController, LoadingIndicatorViewType {
    
    var loadingIndicatorViewController: LoadingIndicatorViewController?
    
    private let presenter: CoffeesPresenterProtocol
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    init(presenter: CoffeesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .label
        
        let barAppearance = UIBarAppearance()
        barAppearance.backgroundColor = Paleta.cafes()
        
        let appearance = UINavigationBarAppearance(barAppearance: barAppearance)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configViews() {
        title = Strings.coffeesTitle()
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(CoffeeViewCell.self, forCellReuseIdentifier: CoffeeViewCell.reuseIdentifier.identifier)
        
        removerTextoDoBotaoVoltar()
        
        view.backgroundColor = .white
    }
    
    private func buildViews() {
        view.addSubview(tableView)
    }
    
    private func buildConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
}

extension CoffeesViewController: CoffeesViewProtocol {
    
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func reload(at indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
}
