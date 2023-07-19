//
//  WonderTinderUITests.swift
//  WonderTinderUITests
//
//  Created by Mazen Amer on 19/07/2023.
//

import XCTest

final class WonderTinderUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLikeCard() {
        let app = XCUIApplication()
        app.launch()
        swipeCards(app: app, isLeft: false)
        app.tabBars["Tab Bar"].buttons["List"].tap()
    }
    
    func testDislikeCard() {
        let app = XCUIApplication()
        app.launch()
        swipeCards(app: app, isLeft: true)
        app.tabBars["Tab Bar"].buttons["List"].tap()
    }
    
    private func swipeCards(app: XCUIApplication, isLeft: Bool) {
        
        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        
        let element1 = element.children(matching: .other).element.children(matching: .other).element(boundBy: 18).children(matching: .other).element.children(matching: .other).element
        
        isLeft ? element1.swipeLeft(velocity: XCUIGestureVelocity(300)) : element1.swipeRight(velocity: XCUIGestureVelocity(300))
        
    }
}
