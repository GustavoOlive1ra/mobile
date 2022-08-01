import UIKit

class MachinesViewController: UIViewController, LoadingIndicatorViewType {
    
    var loadingIndicatorViewController: LoadingIndicatorViewController?
    
    private let presenter: MachinesPresenterProtocol
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = Paleta.fundoCinza()
        return collectionView
    }()
    
    init(presenter: MachinesPresenterProtocol) {
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
        navigationController?.navigationBar.barTintColor = Paleta.maquinas()
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func configViews() {
        title = Strings.machinesTitle()
        
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.register(MachineViewCell.self, forCellWithReuseIdentifier: MachineViewCell.reuseIdentifier.identifier)
        
        removerTextoDoBotaoVoltar()
        
        view.backgroundColor = .white
    }
    
    private func buildViews() {
        view.addSubview(collectionView)
    }
    
    private func buildConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
}

extension MachinesViewController: MachinesViewProtocol {
    
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension MachinesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CollectionViewLayoutConstants.cellSize(basedOn: collectionView.frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(
            top: CollectionViewLayoutConstants.verticalSpacing,
            left: CollectionViewLayoutConstants.horizontalSpacing,
            bottom: CollectionViewLayoutConstants.verticalSpacing,
            right: CollectionViewLayoutConstants.horizontalSpacing
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewLayoutConstants.horizontalSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewLayoutConstants.verticalSpacing
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: abrir tela de produto
    }
    
}

enum CollectionViewLayoutConstants {
    static let horizontalSpacing: CGFloat = 16
    static let verticalSpacing: CGFloat = 20
    
    static func cellSize(basedOn collectionViewWidth: CGFloat) -> CGSize {
        .init(width: (collectionViewWidth - horizontalSpacing) / 2 - horizontalSpacing, height: 260)
    }
}
