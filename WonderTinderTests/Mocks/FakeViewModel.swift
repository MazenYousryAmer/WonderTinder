//
//  FakeViewModel.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 18/07/2023.
//

import Foundation
@testable import WonderTinder

func getFakeWonderSuperHeroViewModel() -> WonderSuperHeroViewModel {
    let testModel1 = WonderSuperHeroModel(name: "test1", url: "")
    let testModel2 = WonderSuperHeroModel(name: "test2", url: "")
    let testViewModel = WonderSuperHeroViewModel(chars: [testModel1, testModel2])
    return testViewModel
}

func getFakeWonderSuperHeroModel() -> WonderSuperHeroModel {
    return WonderSuperHeroModel(name: "test1", url: "")
}

func getFakeMarvelModel() -> MarvelCharacterModel {
    let model = MarvelCharacterModel(code: 0, status: "", copyright: "", attributionText: "", attributionHTML: "", etag: "", data: nil)
    return model
}

func getFake2WonderSuperHeroModels() -> [WonderSuperHeroModel] {
    let obj1 = WonderSuperHeroModel(name: "test1", url: "")
    obj1.isLiked = true
    let obj2 = WonderSuperHeroModel(name: "test2", url: "")
    obj1.isLiked = false
    return [obj1, obj2]
}

func getFake2WonderSuperHeroModelsWhichAreNotLiked() -> [WonderSuperHeroModel] {
    let obj1 = WonderSuperHeroModel(name: "test1", url: "")
    let obj2 = WonderSuperHeroModel(name: "test2", url: "")
    return [obj1, obj2]
}

