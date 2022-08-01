import UIKit

class FavoritesViewController: UIViewController {
    
    private let presenter: FavoritesPresenterProtocol
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.allowsSelectionDuringEditing = false
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    lazy var emptyView: FavoritesEmptyView = {
        let view = FavoritesEmptyView()
        return view
    }()
    
    init(presenter: FavoritesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: true)
        presenter.viewWillAppear()
    }
    
    private func configViews() {
        view.backgroundColor = .white
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(FavoriteViewCell.self, forCellReuseIdentifier: FavoriteViewCell.reuseIdentifier.identifier)
    }
    
    private func buildViews() {
        view.addSubview(tableView)
        view.addSubview(emptyView)
    }
    
    private func buildConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        emptyView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
}

extension FavoritesViewController: FavoritesViewProtocol {
    
    func deleteRow(at indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func showTableView() {
        tableView.isHidden = false
        emptyView.isHidden = true
    }
    
    func showEmptyView() {
        tableView.isHidden = true
        emptyView.isHidden = false
    }
    
}
