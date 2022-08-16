//
//  HomeTabBarViewController.swift
//  Pokedex
//
//  Created by Locação on 03/08/22.
//

import Foundation
import UIKit

class HomeTabBarViewController: UITabBarController {
    
    private var pokemons: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)
        
        let viewController = PokemonCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        
        return navigation
    }
    
    private var profile: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
        
        let viewController = ProfileCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        
        return navigation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [pokemons, profile]
    }
    
}
