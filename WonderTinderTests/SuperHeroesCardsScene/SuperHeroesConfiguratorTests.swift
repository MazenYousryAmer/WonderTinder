//
//  SuperHeroesConfiguratorTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 15/07/2023.
//

import XCTest
@testable import WonderTinder

class SuperHeroesConfiguratorTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testViewControllerIsInitialized() {
        let viewController = SuperHeroesConfigurator.createSuperheroesScene()
        XCTAssertNotNil(viewController)
    }
    
    func testInteractorIsInitialized() {
        let viewController = SuperHeroesConfigurator.createSuperheroesScene()
        XCTAssertNotNil(viewController.interactor)
    }
    
//    func testPresenterIsInitialized() {
//        let viewController = SuperHeroesConfigurator.createSuperheroesScene()
//        XCTAssertNotNil(viewController.interactor?.presenter)
//    }
}
