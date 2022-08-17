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
            make.height.equalTo(20)
        }
        button.contentMode = .scaleAspectFit
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
    
    lazy var editNameButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleEditName)))
        button.tintColor = .black
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .italicSystemFont(ofSize: 25)
        textField.backgroundColor = .white
        textField.textAlignment = .left
        textField.keyboardType = .alphabet
        textField.isHidden = true
        textField.delegate = self
        return textField
    }()
    
    lazy var finishEditButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        button.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleEditName)))
        button.tintColor = .green
        button.isHidden = true
        return button
    }()
    
    lazy var achievementStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.layoutMargins = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var separator: VerticalSeparator = {
        let separator = VerticalSeparator()
        return separator
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
    
    @objc func toggleEditName(){
        if nameLabel.isHidden {
            nameLabel.text = presenter.setName(name: nameTextField.text)
        } else {
            nameTextField.text = nameLabel.text
            nameTextField.becomeFirstResponder()
        }
        
        nameLabel.isHidden = !nameLabel.isHidden
        editNameButton.isHidden = !editNameButton.isHidden
        
        nameTextField.isHidden = !nameTextField.isHidden
        finishEditButton.isHidden = !finishEditButton.isHidden
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        view.addSubview(nameLabel)
        view.addSubview(editNameButton)
        view.addSubview(nameTextField)
        view.addSubview(finishEditButton)
        view.addSubview(achievementStack)
        
        achievementStack.addArrangedSubview(unloackedPokemons)
        achievementStack.addArrangedSubview(separator)
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
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(15)
            make.centerX.equalTo(profileImage)
            make.width.lessThanOrEqualTo(300)
        }
        
        editNameButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel).offset(2)
            make.leading.equalTo(nameLabel.snp.trailing).offset(5)
        }

        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(15)
            make.centerX.equalTo(profileImage)
            make.width.lessThanOrEqualTo(300)
        }
        
        finishEditButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameTextField)
            make.leading.equalTo(nameTextField.snp.trailing).offset(5)
        }
        
        achievementStack.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ProfileViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        toggleEditName()
        return true
    }
}
