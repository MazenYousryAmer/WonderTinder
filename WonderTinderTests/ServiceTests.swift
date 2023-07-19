//
//  NetworkManagerTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 14/07/2023.
//

import XCTest
@testable import WonderTinder

class ServiceTests: XCTestCase {
    var sut: NetworkManager?
    
    override func setUp() {
        super.setUp()
        sut = NetworkManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testPathUrl() {
        let testUrl = "www.apple.com"
        let router = MockService.mock
        XCTAssertEqual(router.path, testUrl)
    }
    
    func testPathParameter() {
        let testparameters = ["test": "Mazen"]
        let router = MockService.mock
        XCTAssertEqual(router.parameters, testparameters)
    }
    
    func testConstructURL() {
        let testUrl = "www.apple.com?test=Mazen"
        let router = MockService.mock
        XCTAssertEqual(router.urlRequest.url?.absoluteString, testUrl)
    }
}
