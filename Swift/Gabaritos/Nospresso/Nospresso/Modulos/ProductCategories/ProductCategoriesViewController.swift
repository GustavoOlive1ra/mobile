import UIKit
import SnapKit

class ProductCategoriesViewController: UIViewController {
    
    private let presenter: ProductCategoriesPresenterProtocol
    
    lazy var itemsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .zero
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var coffeesCategoryView: ProductCategoriesItemView = {
        let view = ProductCategoriesItemView(type: .coffees)
        view.setup(title: Strings.coffeesTitle(), description: Strings.coffeesDescription(), image: Imagens.capsulasInicio())
        view.backgroundColor = Paleta.cafes()
        view.delegate = self
        return view
    }()
    
    lazy var machinesCategoryView: ProductCategoriesItemView = {
        let view = ProductCategoriesItemView(type: .machines)
        view.setup(title: Strings.machinesTitle(), description: Strings.machinesDescription(), image: Imagens.maquinaInicio())
        view.backgroundColor = Paleta.maquinas()
        view.delegate = self
        return view
    }()
    
    lazy var accessoriesCategoryView: ProductCategoriesItemView = {
        let view = ProductCategoriesItemView(type: .accessories)
        view.setup(title: Strings.accessoriesTitle(), description: Strings.accessoriesDescription(), image: Imagens.xicarasInicio())
        view.backgroundColor = Paleta.acessorios()
        view.delegate = self
        return view
    }()
    
    init(presenter: ProductCategoriesPresenterProtocol) {
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
    }
    
    private func configViews() {
        removerTextoDoBotaoVoltar()
        
        view.backgroundColor = Paleta.cafes()
    }
    
    private func buildViews() {
        view.addSubview(itemsStackView)
        
        itemsStackView.addArrangedSubview(coffeesCategoryView)
        itemsStackView.addArrangedSubview(machinesCategoryView)
        itemsStackView.addArrangedSubview(accessoriesCategoryView)
    }
    
    private func buildConstraints() {
        itemsStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }

}

extension ProductCategoriesViewController: ProductCategoriesViewProtocol {
    
}

extension ProductCategoriesViewController: ProductCategoriesItemViewDelegate {
    
    func touched(type: ProductCategoriesItemViewType) {
        switch type {
        case .coffees:
            presenter.coffeesCategoryTouched()
        case .machines:
            presenter.machinesCategoryTouched()
        case .accessories:
            presenter.accessoriesCategoryTouched()
        }
    }
    
}
