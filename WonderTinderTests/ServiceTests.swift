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
//    var mockedService: BaseService = MockService()
    
    override func setUp() {
        super.setUp()
        sut = NetworkManager()
//        sut?.router = MockService
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testPathUrl() {
        //given
        let testUrl = "www.apple.com"
        //when
        let router = MockService.mock
        //then
        XCTAssertEqual(router.path, testUrl)
    }
    
    func testPathParameter() {
        //given
        let testparameters = ["test": "Mazen"]
        //when
        let router = MockService.mock
        //then
        XCTAssertEqual(router.parameters, testparameters)
    }
    
    func testConstructURL() {
        //given
        let testUrl = "www.apple.com?test=Mazen"
        //when
        let router = MockService.mock
        //then
        XCTAssertEqual(router.urlRequest.url?.absoluteString, testUrl)
    }
}
