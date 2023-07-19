//
//  SuperHeroesListingConfiguratorTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 19/07/2023.
//

import XCTest
@testable import WonderTinder

class SuperHeroesListingConfiguratorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewControllerIsInitialized() {
        let viewController = SuperHeroesListingConfigurator.createSuperheroesListingScene(storage: WonderSuperHeroStorage())
        XCTAssertNotNil(viewController)
    }
    
    func testInteractorIsInitialized() {
        let viewController = SuperHeroesListingConfigurator.createSuperheroesListingScene(storage: WonderSuperHeroStorage())
        XCTAssertNotNil(viewController.interactor)
    }
}
