import UIKit

class CoffeeDetailViewController: UIViewController, LoadingIndicatorViewType {
    
    var loadingIndicatorViewController: LoadingIndicatorViewController?
    
    private let presenter: CoffeeDetailPresenterProtocol
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var capsuleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var intensityView: CoffeeIntensityIndicatorView = {
        let view = CoffeeIntensityIndicatorView()
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansLight(size: 12)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansSemiBoldItalic(size: 22)
        return label
    }()
    
    private lazy var originTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansSemiBold(size: 14)
        label.text = Strings.coffeeOrigin()
        return label
    }()
    
    private lazy var originLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansRegular(size: 14)
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var roastingTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansSemiBold(size: 14)
        label.text = Strings.coffeeRoasting()
        return label
    }()
    
    private lazy var roastingLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansRegular(size: 14)
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var aromaticProfileTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansSemiBold(size: 14)
        label.text = Strings.coffeeAromaticProfile()
        return label
    }()
    
    private lazy var aromaticProfileLabel: UILabel = {
        let label = UILabel()
        label.font = Fontes.openSansRegular(size: 14)
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var sizesView: CoffeeCupSizesView = {
        let view = CoffeeCupSizesView()
        return view
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addToCartButtonTouched), for: .touchDown)
        button.titleLabel?.font = Fontes.openSansBold(size: 14)
        button.titleLabel?.textColor = .white
        button.setTitle(Strings.addToCart(), for: .normal)
        button.backgroundColor = Paleta.verdeClaro()
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 1
        return button
    }()
    
    init(presenter: CoffeeDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        self.hidesBottomBarWhenPushed = true
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
        navigationController?.navigationBar.barTintColor = Paleta.cafes()
        navigationController?.navigationBar.tintColor = .label
    }
    
    @objc private func addToFavoritesButtonTouched() {
        presenter.addToFavoritesButtonTouched()
    }
    
    @objc private func addToCartButtonTouched() {
        presenter.addToCartButtonTouched()
    }
    
    private func configViews() {
        removerTextoDoBotaoVoltar()
        
        view.backgroundColor = .white
    }
    
    private func buildViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        
        containerView.addSubview(capsuleImageView)
        containerView.addSubview(intensityView)
        containerView.addSubview(priceLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(originTitleLabel)
        containerView.addSubview(originLabel)
        containerView.addSubview(roastingTitleLabel)
        containerView.addSubview(roastingLabel)
        containerView.addSubview(aromaticProfileTitleLabel)
        containerView.addSubview(aromaticProfileLabel)
        containerView.addSubview(sizesView)
        containerView.addSubview(addToCartButton)
    }
    
    private func buildConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        capsuleImageView.snp.makeConstraints { make in
            make.height.equalTo(140)
            make.top.equalToSuperview().offset(18)
            make.centerX.equalToSuperview()
        }
        
        intensityView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(capsuleImageView.snp.bottom).offset(36)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(18)
            make.centerY.equalTo(intensityView.snp.centerY)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.top.equalTo(intensityView.snp.bottom).offset(40)
        }
        
        originTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(30)
        }
        
        originLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.top.equalTo(originTitleLabel.snp.bottom).offset(8)
        }
        
        roastingTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.top.equalTo(originLabel.snp.bottom).offset(16)
        }
        
        roastingLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.top.equalTo(roastingTitleLabel.snp.bottom).offset(8)
        }
        
        aromaticProfileTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.top.equalTo(roastingLabel.snp.bottom).offset(16)
        }
        
        aromaticProfileLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.top.equalTo(aromaticProfileTitleLabel.snp.bottom).offset(8)
        }
        
        sizesView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.top.equalTo(aromaticProfileLabel.snp.bottom).offset(30)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.top.equalTo(sizesView.snp.bottom).offset(60)
            make.bottom.equalToSuperview().inset(26)
        }
    }
    
}

extension CoffeeDetailViewController: CoffeeDetailViewProtocol {
    
    func setup(with coffee: Cafe) {
        title = coffee.nome
        
        capsuleImageView.carregarImagem(da: coffee.imagem)
        
        intensityView.setup(with: coffee.intensidade ?? 0)
        priceLabel.attributedText = buildPriceText(using: coffee.precoSleeve)
        
        descriptionLabel.text = coffee.descricao
        originLabel.text = coffee.origem
        roastingLabel.text = coffee.torrefacao
        aromaticProfileLabel.text = coffee.perfilAromatico
        
        sizesView.setup(with: coffee.medidas)
    }
    
    func setupFavoriteButton(isAFavorite: Bool) {
        let image: UIImage? = isAFavorite ? .heartFill : .heart
        let color = isAFavorite ? Paleta.vermelhoAmor() : .black
        
        let actionButton = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(self.addToFavoritesButtonTouched)
        )
        
        actionButton.tintColor = color
        
        navigationItem.rightBarButtonItems = [actionButton]
    }
    
}

private extension CoffeeDetailViewController {
    
    func buildPriceText(using price: Double) -> NSMutableAttributedString {
        let text = Strings.coffeePriceDescription().estilizadaCom(Fontes.openSansLight(size: 12)!, cor: Paleta.textoCinzaDiscreto()!)
        let price = price.comoDinheiro.estilizadaCom(Fontes.openSansLight(size: 24)!, cor: .black)
        
        text.append(price)
        
        return text
    }
    
}
