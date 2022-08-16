import UIKit
import SnapKit

internal class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    private let presenter: ProfilePresenterProtocol
    
    lazy var chooseImageButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "camera.badge.ellipsis"), for: .normal)
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chooseImage)))
        button.tintColor = .black
        button.snp.makeConstraints { make in
            make.size.equalTo(26)
        }
        button.contentMode = .scaleToFill
        return button
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 90
        image.layer.masksToBounds = true
        image.snp.makeConstraints { make in
            make.size.equalTo(180)
        }
        return image
    }()
    
    lazy var nameStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
    lazy var editNameButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
        button.tintColor = .black
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var achievementStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 14
        stack.layoutMargins = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var unloackedPokemons: ProfileAchievementView = {
        let profile = ProfileAchievementView()
        return profile
    }()
    
    lazy var favoritePokemons: ProfileAchievementView = {
        let profile = ProfileAchievementView()
        return profile
    }()
    
    internal init(presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @objc func chooseImage(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self;
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        presenter.setGaleryImage(image: image)
        self.dismiss(animated: true, completion: nil)
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

}

// MARK: - ProfileViewControllerProtocol
extension ProfileViewController: ProfileViewProtocol {
    func setup(qtdUnloacked: Int, qtdFavorite: Int) {
        unloackedPokemons.setup(qtd: String(qtdUnloacked), image: Images.pokebola(), color: nil)
        favoritePokemons.setup(qtd: String(qtdFavorite), image: .starFill, color: Colors.star())
    }
    
    func setup(profile: Profile) {
        profileImage.image = profile.image?.toUIImage()
        nameLabel.text = profile.name
    }
    

}

extension ProfileViewController {
    
    func configViews() {
        view.backgroundColor = .white
    }
    
    func buildViews() {
        view.addSubview(profileImage)
        view.addSubview(chooseImageButton)
        view.addSubview(nameStack)
        view.addSubview(achievementStack)
        
        nameStack.addArrangedSubview(nameLabel)
        nameStack.addArrangedSubview(editNameButton)
        
        achievementStack.addArrangedSubview(unloackedPokemons)
        achievementStack.addArrangedSubview(favoritePokemons)
    }
    
    func buildConstraints() {
        profileImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
        }
        chooseImageButton.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(profileImage).inset(2)
        }
        nameStack.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(15)
            make.centerX.equalTo(profileImage).offset(10)
        }
        
        achievementStack.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
