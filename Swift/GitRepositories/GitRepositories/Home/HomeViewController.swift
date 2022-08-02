//
//  ViewController.swift
//  GitRepositories
//
//  Created by Locação on 01/08/22.
//

import UIKit

class HomeViewController: UITabBarController {

    private var repositoriesCategory: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Repositories", image: UIImage(named: "Star"), tag: 0)
        
        let viewController = RepositoriesCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        
        return navigation
    }
    
    private var SearchCategory: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Search", image: UIImage(named: "Star"), tag: 0)
        
        let viewController = RepositoriesCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        
        return navigation
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [repositoriesCategory, SearchCategory]
    }
}

