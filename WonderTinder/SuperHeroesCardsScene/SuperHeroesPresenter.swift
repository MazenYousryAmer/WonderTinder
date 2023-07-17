//
//  SuperHeroesPresenter.swift
//  WonderTinder
//
//  Created by Mazen Amer on 15/07/2023.
//

import Foundation

protocol PresenterInterface: AnyObject {
    func presentError()
    func presentCharacters(model: MarvelCharacterModel)
}

class SuperHeroesPresenter {
    weak var displayView: ViewControllerDisplayInterface?
    
    required init(displayView: ViewControllerDisplayInterface) {
        self.displayView = displayView
    }
}

extension SuperHeroesPresenter: PresenterInterface {
    func presentCharacters(model: MarvelCharacterModel) {
        
        guard let heroArray = model.data?.results, heroArray.count >= 1 else {
            return
        }
        
        let viewModel = WonderSuperHeroViewModel()
        for hero in heroArray {
            let wonderModel = WonderSuperHeroModel(name: hero.name ?? "", url: "\( hero.thumbnail?.path ?? "").\(hero.thumbnail?.extension ?? "")")
            viewModel.allSuperheroCharaters.append(wonderModel)
        }
        
        displayView?.showSuperheroes(viewModel: viewModel)
    }
    
    func presentError() {
        displayView?.showError()
    }
    
}
