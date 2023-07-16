//
//  SuperHeroesConfigurator.swift
//  WonderTinder
//
//  Created by Mazen Amer on 15/07/2023.
//

import UIKit

class SuperHeroesConfigurator {
    static func createSuperheroesScene() -> SuperHeroesViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SuperHeroesViewController") as! SuperHeroesViewController
//        let viewController = SuperHeroesViewController()
        let presenter = SuperHeroesPresenter(displayView: viewController)
        let interactor = SuperHeroesInteractor(presenter: presenter)
        viewController.interactor = interactor
        return viewController
    }
}
