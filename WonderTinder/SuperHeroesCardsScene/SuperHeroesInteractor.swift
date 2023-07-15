//
//  SuperHeroesInteractor.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

protocol InteractorInterface: AnyObject {
    func fetchCharacters()
    func changelbl()
}

class SuperHeroesInteractor {
    
    var marvelCharacterModel: MarvelCharacterModel?
    
    var presenter: PresenterInterface
    var worker = CharactersWorker()
    
    required init(presenter: PresenterInterface) {
        self.presenter = presenter
    }

    func changelbl() {
        presenter.changelbl()
    }
}

extension SuperHeroesInteractor: InteractorInterface {
    func fetchCharacters() {
        worker.fetchCharacters(completion: { model, error in
            print(model)
        })
    }
}
