//
//  SuperHeroesListingInteractor.swift
//  WonderTinder
//
//  Created by Mazen Amer on 16/07/2023.
//

import Foundation

protocol ListingInteractorInterface: AnyObject {
    func listHeroes()
    func setShowedSuperHeroes(heroes: [WonderSuperHeroModel])
    func getShowedSuperHeroes() -> [WonderSuperHeroModel]
    func getSuperHero(index: Int) -> WonderSuperHeroModel
}

class SuperHeroesListingInteractor {
    
    var presenter: SuperHeroesListingPresenter
    var storage: WonderSuperHeroStorage!
    
    required init(presenter: SuperHeroesListingPresenter) {
        self.presenter = presenter
    }
}

extension SuperHeroesListingInteractor: ListingInteractorInterface {
    func listHeroes() {
        guard storage.viewModel != nil else {
            presenter.presentEmptyState()
            return
        }
        presenter.presentHeroes(viewModel: storage.viewModel)
    }
    
    func setShowedSuperHeroes(heroes: [WonderSuperHeroModel]) {
        storage.showedSuperHeroes = heroes
    }
    
    func getShowedSuperHeroes() -> [WonderSuperHeroModel] {
        return storage.showedSuperHeroes
    }
    
    func getSuperHero(index: Int) -> WonderSuperHeroModel {
        return storage.showedSuperHeroes[index]
    }
}
