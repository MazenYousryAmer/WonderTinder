//
//  SuperHeroesPresenterMock.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 15/07/2023.
//

import XCTest
@testable import WonderTinder

class SuperHeroesPresenterTests: XCTestCase {
    
    var sut: SuperHeroesPresenter!
    var displayView: SuperHeroesViewControllerSpy!
    
    override func setUp() {
        super.setUp()
        displayView = SuperHeroesViewControllerSpy()
        sut = SuperHeroesPresenter(displayView: displayView)
    }
    
    override func tearDown() {
        displayView = nil
        sut = nil
        super.tearDown()
    }
    
    private func readTestData() -> MarvelCharacterModel {
        if let path = Bundle.main.path(forResource: "TestData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if jsonResult is Dictionary<String, AnyObject> {
                    let viewModel = try! JSONDecoder().decode(MarvelCharacterModel.self, from: data)
                    return viewModel
                }
            } catch {
                return getFakeMarvelModel()
            }
        }
        return getFakeMarvelModel()
    }
    
    func testPresentCharacters() {
        sut.presentCharacters(model: readTestData())
        XCTAssertEqual(displayView.canShowSuperHeroes, true)
    }
    
    func testShowError() {
        sut.presentError()
        XCTAssertEqual(displayView.isErrorShown, true)
    }
    
}

class SuperHeroesViewControllerSpy: ViewControllerDisplayInterface {
    
    var canShowSuperHeroes = false
    func showSuperheroes(viewModel: WonderTinder.WonderSuperHeroViewModel) {
        canShowSuperHeroes = true
    }
    
    var isErrorShown = false
    func showError() {
        isErrorShown = true
    }
}
