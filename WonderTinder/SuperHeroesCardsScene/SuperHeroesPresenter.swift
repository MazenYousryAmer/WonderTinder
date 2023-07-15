//
//  SuperHeroesPresenter.swift
//  WonderTinder
//
//  Created by Mazen Amer on 15/07/2023.
//

import Foundation

protocol PresenterInterface: AnyObject {
    func changelbl()
}

class SuperHeroesPresenter {
    weak var displayView: ViewControllerInterface?
    
    required init(displayView: ViewControllerInterface) {
        self.displayView = displayView
    }
}

extension SuperHeroesPresenter: PresenterInterface {
    func changelbl() {
        displayView?.changelbl()
    }
}
