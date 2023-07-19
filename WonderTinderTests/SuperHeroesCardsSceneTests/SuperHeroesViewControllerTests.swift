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
    }
    
    override func tearDown() {
        sut?.interactor = nil
        sut = nil
        super.tearDown()
    }
    
    func testFetchCharacters() {
        sut?.interactor.fetchCharacters(service: CharactersService.characters)
        XCTAssertEqual(spyInteractor?.areCharactersFetched, true)
    }
    
    func testShowSuperHeroes() {
        let testViewModel: WonderSuperHeroViewModel = getFakeWonderSuperHeroViewModel()
        sut?.showSuperheroes(viewModel: testViewModel)
        XCTAssertEqual(spyInteractor?.isViewModelSet, true)
        XCTAssertEqual(spyInteractor?.storage.viewModel.allSuperheroCharaters.count, testViewModel.allSuperheroCharaters.count)
    }
    
    func testLikeSuperHero() {
        let card = SuperHeroCardView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        card.tag = 1
        card.delegate = self
        card.configureCard(model: getFakeWonderSuperHeroModel())
        sut?.cardContainerView.addSubview(card)
        card.delegate.likeSuperHero(shouldLike: true, card: card)
        XCTAssertEqual(spyInteractor?.isSetIsLikedCalled, true)
    }
}

extension SuperHeroesViewControllerTests: SuperHeroCarViewDelegate {
    
    func likeSuperHero(shouldLike: Bool, card: WonderTinder.SuperHeroCardView) {
        XCTAssertTrue(shouldLike)
        XCTAssertEqual(card.tag, 1)
        spyInteractor?.setIsLiked(shouldLike, for: card)
    }
}

class SuperHeroesInteractorSpy: InteractorInterface {
    
    var storage = WonderSuperHeroStorage()
    
    var isViewModelSet = false
    func setSuperHeroesViewModel(viewModel: WonderTinder.WonderSuperHeroViewModel) {
        isViewModelSet = true
        storage.viewModel = viewModel
    }
    
    var isSetIsLikedCalled = false
    func setIsLiked(_ isliked: Bool, for superHeroCard: WonderTinder.SuperHeroCardView) {
        isSetIsLikedCalled = true
    }
    
    func getSuperHeroesViewModel() -> WonderTinder.WonderSuperHeroViewModel {
        return getFakeWonderSuperHeroViewModel()
    }
    
    var areCharactersFetched = false
    func fetchCharacters(service: WonderTinder.BaseService) {
        areCharactersFetched = true
    }
}
