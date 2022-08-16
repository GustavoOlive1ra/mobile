import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol ProfileCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol ProfileViewProtocol: AnyObject {
    func setup(profile: Profile)
    func setup(qtdUnloacked: Int, qtdFavorite: Int)
}

// ViewController -> Presenter
internal protocol ProfilePresenterProtocol {
    func viewDidLoad()
    func setGaleryImage(image: UIImage?)
}

// Presenter -> Repository
internal protocol ProfileRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol ProfileRepositoryOutputProtocol: AnyObject {
    
}
