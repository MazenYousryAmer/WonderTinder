//
//  SuperHeroListingInteractorTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 19/07/2023.
//
import XCTest
@testable import WonderTinder

class SuperHeroListingInteractorTests: XCTestCase {
    
    private var sut: SuperHeroesListingInteractor?
    private var presenter: SuperHeroesListingPresenterSpy?

    override func setUp() {
        super.setUp()
        presenter = SuperHeroesListingPresenterSpy()
        sut = SuperHeroesListingInteractor(presenter: presenter!)
        sut?.storage = WonderSuperHeroStorage()
        let viewController =  SuperHeroesListingConfigurator.createSuperheroesListingScene(storage: WonderSuperHeroStorage())
        viewController.interactor = sut
    }
    
    override func tearDown() {
        sut?.presenter = nil
        sut?.storage = nil
        sut = nil
        super.tearDown()
    }
    
    func testEmptyList() {
        sut?.listHeroes()
        XCTAssertEqual(presenter?.isPresentEmptyStateCalled, true)
    }
    
    func testNotEmptyList() {
        sut?.storage.viewModel = getFakeWonderSuperHeroViewModel()
        sut?.listHeroes()
        XCTAssertEqual(presenter?.isPresentHeroesCalled, true)
    }
    
}

class SuperHeroesListingPresenterSpy: ListingPresenterInterface {
    
    var isPresentHeroesCalled = false
    func presentHeroes(viewModel: WonderTinder.WonderSuperHeroViewModel) {
        isPresentHeroesCalled = true
    }
    
    var isPresentEmptyStateCalled = false
    func presentEmptyState() {
        isPresentEmptyStateCalled = true
    }
    
    
}
