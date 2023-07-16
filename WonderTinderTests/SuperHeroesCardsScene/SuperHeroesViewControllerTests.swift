//
//  SuperHeroesViewControllerTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 15/07/2023.
//

import XCTest
@testable import WonderTinder

class SuperHeroesViewControllerTests: XCTestCase {
    private var sut: SuperHeroesViewController?
    private var spyInteractor: SuperHeroesInteractorSpy?
    
    override func setUp() {
        super.setUp()
        spyInteractor = SuperHeroesInteractorSpy()
        sut = SuperHeroesConfigurator.createSuperheroesScene()
        sut?.interactor = spyInteractor
    }
    
    override func tearDown() {
        sut?.interactor = nil
        sut = nil
        super.tearDown()
    }
    
    func testFetchCharacters() {
        sut?.interactor.fetchCharacters()
        XCTAssertEqual(spyInteractor?.areCharactersFetched, true)
    }
}

class SuperHeroesInteractorSpy: InteractorInterface {
    func storeViewModel(viewModel: WonderTinder.WonderSuperHeroViewModel) {
        
    }
    
    var areCharactersFetched = false
    func fetchCharacters() {
        areCharactersFetched = true
    }
}
