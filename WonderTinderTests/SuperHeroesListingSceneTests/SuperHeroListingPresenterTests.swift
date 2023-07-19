//
//  SuperHeroListingPresenterTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 19/07/2023.
//

import XCTest
@testable import WonderTinder

class SuperHeroListingPresenterTests: XCTestCase {
    
    var sut: SuperHeroesListingPresenter!
    var displayView: ListingSuperHeroesViewControllerSpy!

    override func setUp() {
        super.setUp()
        displayView = ListingSuperHeroesViewControllerSpy()
        sut = SuperHeroesListingPresenter(displayView: displayView)
    }
    
    override func tearDown() {
        displayView = nil
        sut = nil
        super.tearDown()
    }
    
    func testPresentEmptyState() {
        sut.presentEmptyState()
        XCTAssertEqual(displayView.isDisplayEmptyView, true)
    }
    
    func testPresentHeroes() {
        let testDataArr = getFake2WonderSuperHeroModels()
        let testViewModel = WonderSuperHeroViewModel(chars: testDataArr)
        sut.presentHeroes(viewModel: testViewModel)
        XCTAssertEqual(displayView.isDisplaySuperHeroesCalled, true)
    }
    
    func testPresentHeroesButEmpty() {
        let testDataArr = getFake2WonderSuperHeroModelsWhichAreNotLiked()
        let testViewModel = WonderSuperHeroViewModel(chars: testDataArr)
        sut.presentHeroes(viewModel: testViewModel)
        XCTAssertEqual(displayView.isDisplayEmptyView, true)
    }
    
}

class ListingSuperHeroesViewControllerSpy: ListingDisplayInterface {
    
    var isDisplaySuperHeroesCalled = false
    func displaySuperHeroes(heroes: [WonderTinder.WonderSuperHeroModel]) {
        isDisplaySuperHeroesCalled = true
    }
    
    var isDisplayEmptyView = false
    func displayEmptyView() {
        isDisplayEmptyView = true
    }
    
}
