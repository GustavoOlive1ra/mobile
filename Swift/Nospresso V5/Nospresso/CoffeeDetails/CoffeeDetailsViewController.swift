import UIKit

internal class CoffeeDetailsViewController: UIViewController, LoadingIndicatorViewType {
    var loadingIndicatorViewController: UIViewController?

    private let presenter: CoffeeDetailsPresenterProtocol
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var capsuleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var intensityView: CoffeeIntensity = {
        let view = CoffeeIntensity()
        return view
    }()
    
    lazy var infoStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    lazy var originView: CoffeeInfos = {
        let view = CoffeeInfos()
        return view
    }()
    
    lazy var roastingView: CoffeeInfos = {
        let view = CoffeeInfos()
        return view
    }()
    
    lazy var aromaticProfileView: CoffeeInfos = {
        let view = CoffeeInfos()
        return view
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var tastingLabel: UILabel = {
        let label = UILabel()
        label.text = "FORMAS DE DEGUSTAÇÃO"
        label.font = Fonts.openSansLight(size: 12)
        label.textColor = .black
        return label
    }()
    
    lazy var tastingStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 16
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansSemiBoldItalic(size: 22)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var addBagButtun: UIButton = {
        let btn = UIButton()
        btn.setTitle("Adicionar à sacola", for: .normal)
        btn.titleLabel?.font = Fonts.openSansBold(size: 14)
        btn.backgroundColor = Colors.verdaoVendedor()
        btn.setTitleColor(.white, for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btn.layer.shadowOpacity = 1.0
        btn.layer.shadowRadius = 2
        return btn
    }()

    internal init(presenter: CoffeeDetailsPresenterProtocol) {
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
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupFavoritesButton() {
        let image = UIImage(systemName: "heart")
        
        let buttonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(addToFavoritesTouched)
        )
        
        navigationItem.rightBarButtonItems = [buttonItem]
    }
    
    private func createPriceText(using price: Double) -> NSMutableAttributedString {
        var priceText = Localizable.tenCapsules().withStyle(Fonts.openSansLight(size: 12)!, Colors.textoCinzaDiscreto()!)
        priceText += price.asMoney.withStyle(Fonts.openSansLight(size: 20)!, .black)
        return priceText
    }
    
    @objc func addToFavoritesTouched() {
        //
    }

}

extension CoffeeDetailsViewController {
    
    func configViews() {
        setupFavoritesButton()
        
        view.backgroundColor = .white
    }
    
    func buildViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(capsuleImageView)
        contentView.addSubview(intensityView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(infoStackView)
        contentView.addSubview(tastingLabel)
        contentView.addSubview(tastingStackView)
        contentView.addSubview(addBagButtun)
        
        infoStackView.addArrangedSubview(originView)
        infoStackView.addArrangedSubview(roastingView)
        infoStackView.addArrangedSubview(aromaticProfileView)
    }
    
    func mapTastingStackView(sizes: [String]){
        for size in sizes {
            let tasting = CoffeeSize()
            tastingStackView.addArrangedSubview(tasting)
            tasting.setup(size: size)
        }
    }
    
    func buildConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        capsuleImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
        }
        
        intensityView.snp.makeConstraints { make in
            make.top.equalTo(capsuleImageView.snp.bottom).offset(38)
            make.leading.equalToSuperview().offset(18)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(capsuleImageView.snp.bottom).offset(38)
            make.trailing.equalToSuperview().inset(18)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(43)
            make.leading.equalTo(intensityView)
            make.trailing.equalTo(priceLabel)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(15)
            make.leading.equalTo(intensityView)
            make.trailing.equalTo(priceLabel)
        }
        
        tastingLabel.snp.makeConstraints{ make in
            make.top.equalTo(infoStackView.snp.bottom).offset(28)
            make.leading.equalTo(intensityView)
        }
        
        tastingStackView.snp.makeConstraints{ make in
            make.top.equalTo(tastingLabel.snp.bottom).offset(11)
            make.leading.equalTo(intensityView)
            
        }
        
        addBagButtun.snp.makeConstraints{make in
            make.top.equalTo(tastingStackView.snp.bottom).offset(170)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(23)
            make.width.equalTo(289)
            make.height.equalTo(47)
        }
    }
    
}

// MARK: - CoffeeDetailsViewControllerProtocol
extension CoffeeDetailsViewController: CoffeeDetailsViewProtocol {
    
    func setup(with coffeeDetails: CoffeeDetails) {
        DispatchQueue.main.async {
            self.capsuleImageView.loadImage(from: coffeeDetails.image)
            self.intensityView.setup(intensity: coffeeDetails.intensity ?? 0)
            self.priceLabel.attributedText = self.createPriceText(using: coffeeDetails.price)
            self.descriptionLabel.text = coffeeDetails.description
            self.originView.setup(title: "Origem", description: coffeeDetails.origin)
            self.roastingView.setup(title: "Torrefação", description: coffeeDetails.roasting)
            self.aromaticProfileView.setup(title: "Perfil Aromático", description: coffeeDetails.aromaticProfile)
            self.mapTastingStackView(sizes: coffeeDetails.sizes)
        }
    }
    
    func setup(name: String) {
        title = name
    }

}
