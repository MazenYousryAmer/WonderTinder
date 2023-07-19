//
//  SuperHeroesInteractorTests.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 15/07/2023.
//

import XCTest
@testable import WonderTinder

class SuperHeroesInteractorTests: XCTestCase {
    private var sut: SuperHeroesInteractor?
    private var fakeWorker = FakeCharactersWorker()
    private var presenter: SuperHeroesPresenterSpy?
    
    override func setUp() {
        super.setUp()
        presenter = SuperHeroesPresenterSpy()
        sut = SuperHeroesInteractor(presenter: presenter!)
        sut?.characterWorker = fakeWorker
        let vc = SuperHeroesConfigurator.createSuperheroesScene(storage: WonderSuperHeroStorage())
        vc.interactor = sut
    }
    
    override func tearDown() {
        sut?.presenter = nil
        sut = nil
        super.tearDown()
    }
    
    func testWorkerCallingURL() {
        sut?.fetchCharacters(service: CharactersService.characters)
        XCTAssertEqual(fakeWorker.apiCalled, true)
    }
    
    func testFetchCharactersWithError() {
        let exp = expectation(description: "Wait for error")
        
        fakeWorker.workerStub = (nil,TestError())
        sut?.fetchCharacters(service: CharactersService.characters)
        XCTAssertEqual(fakeWorker.apiCalled, true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(4000)) {
            XCTAssertEqual(self.presenter?.isPresentError, true)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
    
    func testFetchCharactersWithSuccess() {
        let exp = expectation(description: "Wait for success")
        
        fakeWorker.workerStub = (getFakeMarvelModel(),nil)
        sut?.fetchCharacters(service: CharactersService.characters)
        XCTAssertEqual(fakeWorker.apiCalled, true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(4000)) {
            XCTAssertEqual(self.presenter?.araCharactersPresented, true)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
    
    
class SuperHeroesPresenterSpy: PresenterInterface {
    
    var isPresentError = false
    func presentError() {
        isPresentError = true
    }
    
    var araCharactersPresented = false
    func presentCharacters(model: WonderTinder.MarvelCharacterModel) {
        araCharactersPresented = true
    }
}
