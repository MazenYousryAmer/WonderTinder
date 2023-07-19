//
//  SuperHeroesListingViewControllerTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 19/07/2023.
//

import XCTest
@testable import WonderTinder

class SuperHeroesListingViewControllerTests: XCTestCase {

    private var sut: SuperHeroesListingViewController?
    private var spyInteractor: SuperHeroesListingInteractorSpy?

    override func setUp() {
        super.setUp()
        
        spyInteractor = SuperHeroesListingInteractorSpy()
        sut = SuperHeroesListingConfigurator.createSuperheroesListingScene(storage: WonderSuperHeroStorage())
        sut?.interactor = spyInteractor
        sut?.loadView()
    }
    
    override func tearDown() {
        sut?.interactor = nil
        sut = nil
        super.tearDown()
    }
    
    func testGetHeroesList() {
        sut?.getHeroesList()
        XCTAssertEqual(spyInteractor?.isListHeroesCalled, true)
    }
    
    func testGetShowedSuperHeroes() {
        spyInteractor?.storage.showedSuperHeroes = getFake2WonderSuperHeroModels()
        XCTAssertEqual(sut?.interactor.getShowedSuperHeroes().count, 2)
    }
    
    func testDisplaySuperHeroes() {
        sut?.displaySuperHeroes(heroes: spyInteractor?.getShowedSuperHeroes() ?? [])
        XCTAssertEqual(spyInteractor?.isSetShowedSuperHeroesCalled, true)
    }
    
    func testDisplayEmptySuperHeroes() {
        spyInteractor?.shouldShowEmpty = true
        sut?.displaySuperHeroes(heroes: [])
        XCTAssertEqual(spyInteractor?.isSetShowedSuperHeroesCalled, true)
        XCTAssertEqual(sut?.interactor.getShowedSuperHeroes().count, 0)
    }

}

class SuperHeroesListingInteractorSpy: ListingInteractorInterface {
    
    var storage = WonderSuperHeroStorage()
    
    var isListHeroesCalled = false
    func listHeroes() {
        isListHeroesCalled = true
    }
    
    var isSetShowedSuperHeroesCalled = false
    func setShowedSuperHeroes(heroes: [WonderTinder.WonderSuperHeroModel]) {
        isSetShowedSuperHeroesCalled = true
    }
    
    
    var shouldShowEmpty = false
    func getShowedSuperHeroes() -> [WonderTinder.WonderSuperHeroModel] {
        shouldShowEmpty ? [] : getFake2WonderSuperHeroModels()
    }
    
    func getSuperHero(index: Int) -> WonderTinder.WonderSuperHeroModel {
        return getFakeWonderSuperHeroModel()
    }

    
}
