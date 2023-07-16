//
//  SuperHeroesInteractor.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

protocol InteractorInterface: AnyObject {
    func fetchCharacters()
    func storeViewModel(viewModel: WonderSuperHeroViewModel)
    func setIsLiked(_ isliked: Bool,for superHeroCard: SuperHeroCardView)
}

class SuperHeroesInteractor {
    
    var marvelCharacterModel: MarvelCharacterModel?
    
    var presenter: PresenterInterface
    var worker = CharactersWorker()
    var storage: WonderSuperHeroStorage!
//    var viewModel: WonderSuperHeroViewModel?
    
    required init(presenter: PresenterInterface) {
        self.presenter = presenter
    }
}

extension SuperHeroesInteractor: InteractorInterface {
    func setIsLiked(_ isliked: Bool, for superHeroCard: SuperHeroCardView) {
        isliked ? superHeroCard.superHeroCharacter.like() : superHeroCard.superHeroCharacter.dislike()
        print(storage.viewModel?.allSuperheroCharaters[superHeroCard.tag].isLiked)
    }
    
    func fetchCharacters() {
        worker.fetchCharacters(completion: {[weak self] model, error in
            guard let model = model else {
                DispatchQueue.main.async {
                    self?.presenter.presentError()
                }
                return
            }
            self?.presenter.presentCharacters(model: model)
        })
    }
    
    func storeViewModel(viewModel: WonderSuperHeroViewModel){
//        self.viewModel = viewModel
        storage.viewModel = viewModel
    }
}
