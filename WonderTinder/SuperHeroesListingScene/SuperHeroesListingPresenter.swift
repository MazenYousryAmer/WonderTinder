//
//  SuperHeroesListingPresenter.swift
//  WonderTinder
//
//  Created by Mazen Amer on 16/07/2023.
//

import Foundation

protocol ListingPresenterInterface: AnyObject {
    func presentHeroes(viewModel: WonderSuperHeroViewModel)
}

class SuperHeroesListingPresenter {
    
    weak var displayView: ListingDisplayInterface?
    
    required init(displayView: ListingDisplayInterface) {
        self.displayView = displayView
    }
}

extension SuperHeroesListingPresenter: ListingPresenterInterface {
    func presentHeroes(viewModel: WonderSuperHeroViewModel) {
        let showedSuperHeroes = viewModel.allSuperheroCharaters.filter({ $0.isLiked != nil })
        showedSuperHeroes.count > 0 ? displayView?.displaySuperHeroes(heroes: showedSuperHeroes.reversed()  ) : displayView?.displayEmptyView()
    }
}
