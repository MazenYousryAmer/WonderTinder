//
//  SuperHeroesConfiguratorTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 15/07/2023.
//

import XCTest
@testable import WonderTinder

class SuperHeroesConfiguratorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewControllerIsInitialized() {
        let viewController = SuperHeroesConfigurator.createSuperheroesScene(storage: WonderSuperHeroStorage())
        XCTAssertNotNil(viewController)
    }
    
    func testInteractorIsInitialized() {
        let viewController = SuperHeroesConfigurator.createSuperheroesScene(storage: WonderSuperHeroStorage())
        XCTAssertNotNil(viewController.interactor)
    }
}
