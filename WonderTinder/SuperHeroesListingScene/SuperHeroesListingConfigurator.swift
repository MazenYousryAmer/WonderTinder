//
//  SuperHeroesListingConfigurator.swift
//  WonderTinder
//
//  Created by Mazen Amer on 16/07/2023.
//

import UIKit

class SuperHeroesListingConfigurator {
    static func createSuperheroesListingScene(storage: WonderSuperHeroStorage) -> SuperHeroesListingViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SuperHeroesListingViewController") as! SuperHeroesListingViewController
        let presenter = SuperHeroesListingPresenter(displayView: viewController)
        let interactor = SuperHeroesListingInteractor(presenter: presenter)
        interactor.storage = storage
        viewController.interactor = interactor
        return viewController
    }
}
