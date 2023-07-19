//
//  SuperHeroesInteractor.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

protocol InteractorInterface: AnyObject {
    func fetchCharacters(service: BaseService)
    func setSuperHeroesViewModel(viewModel: WonderSuperHeroViewModel)
    func setIsLiked(_ isliked: Bool,for superHeroCard: SuperHeroCardView)
    func getSuperHeroesViewModel() -> WonderSuperHeroViewModel
}

class SuperHeroesInteractor {
    
    var marvelCharacterModel: MarvelCharacterModel?
    
    var presenter: PresenterInterface!
    var characterWorker = CharactersWorker()
    var storage: WonderSuperHeroStorage!
    
    required init(presenter: PresenterInterface) {
        self.presenter = presenter
    }
}

extension SuperHeroesInteractor: InteractorInterface {
    func setIsLiked(_ isliked: Bool, for superHeroCard: SuperHeroCardView) {
        isliked ? superHeroCard.superHeroCharacter.like() : superHeroCard.superHeroCharacter.dislike()
    }
    
    func fetchCharacters(service: BaseService) {
        characterWorker.fetchCharacters(service: service, completion: {[weak self] model, error in
            guard let model = model else {
                DispatchQueue.main.async {
                    self?.presenter.presentError()
                }
                return
            }
            self?.presenter.presentCharacters(model: model)
        })
    }
    
    func setSuperHeroesViewModel(viewModel: WonderSuperHeroViewModel){
        storage.viewModel = viewModel
    }
    
    func getSuperHeroesViewModel() -> WonderSuperHeroViewModel {
        return storage.viewModel
    }
}
