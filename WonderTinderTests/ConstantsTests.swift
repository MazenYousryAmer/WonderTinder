//
//  ConstantsTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 14/07/2023.
//

import XCTest
@testable import WonderTinder

final class ConstantsTests: XCTestCase {
    
    func testUrlDomainIsNotEmpty() {
        XCTAssertEqual(Constants.serverUrl, "http://gateway.marvel.com/v1/public")
    }
    
    func testPublicKeyIsNotEmpty() {
        XCTAssertNotNil(Constants.publicKey)
    }
    
    func testPrivateKeyIsNotEmpty() {
        XCTAssertNotNil(Constants.privateKey)
    }
}
