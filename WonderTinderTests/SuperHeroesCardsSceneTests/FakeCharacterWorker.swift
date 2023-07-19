//
//  FakeCharacterWorker.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 18/07/2023.
//

import Foundation
@testable import WonderTinder

class TestError: Error {}

class FakeCharactersWorker: CharactersWorker {
    
    var workerStub: (MarvelCharacterModel?, Error?)?
    var apiCalled = false
    
    override func fetchCharacters(service: WonderTinder.BaseService, completion: @escaping (WonderTinder.MarvelCharacterModel?, Error?) -> Void) {
        apiCalled = true
        if let stub = workerStub {
            completion(stub.0, stub.1)
        }
    }
}
