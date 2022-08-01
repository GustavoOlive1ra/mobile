import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [productCategories, favorites]
    }

    var productCategories: UIViewController {
        let navigation = UINavigationController()
        let viewController = ProductCategoriesCoordinator.createModule(using: navigation)
        
        navigation.viewControllers = [viewController]

        navigation.tabBarItem = .init(title: Strings.products(), image: UIImage(systemName: "cart"), tag: 0)
        
        return navigation
    }
    
    var favorites: UIViewController {
        let navigation = UINavigationController()
        let viewController = FavoritesCoordinator.createModule(using: navigation)
        
        navigation.viewControllers = [viewController]

        navigation.tabBarItem = .init(title: Strings.favorites(), image: UIImage(systemName: "heart"), tag: 1)
        
        return navigation
    }
    
}
