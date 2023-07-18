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
        sut = SuperHeroesConfigurator.createSuperheroesScene(storage: WonderSuperHeroStorage())
        sut?.interactor = spyInteractor
        sut?.loadView()
//        sut?.viewDidLoad()
        
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
    
    func testShowSuperHeroes() {
        let testViewModel: WonderSuperHeroViewModel = getFakeViewModel()
        sut?.showSuperheroes(viewModel: testViewModel)
        XCTAssertEqual(spyInteractor?.isViewModelSet, true)
        XCTAssertEqual(spyInteractor?.storage.viewModel.allSuperheroCharaters.count, testViewModel.allSuperheroCharaters.count)
    }
}

class SuperHeroesInteractorSpy: InteractorInterface {
    
    var storage = WonderSuperHeroStorage()
    
    var isViewModelSet = false
    func setSuperHeroesViewModel(viewModel: WonderTinder.WonderSuperHeroViewModel) {
        isViewModelSet = true
        storage.viewModel = viewModel
    }
    
    func setIsLiked(_ isliked: Bool, for superHeroCard: WonderTinder.SuperHeroCardView) {
        
    }
    
    func getSuperHeroesViewModel() -> WonderTinder.WonderSuperHeroViewModel {
        return getFakeViewModel()
    }
    
    var areCharactersFetched = false
    func fetchCharacters() {
        areCharactersFetched = true
    }
}
