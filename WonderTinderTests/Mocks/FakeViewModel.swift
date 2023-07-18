//
//  FakeViewModel.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 18/07/2023.
//

import Foundation
@testable import WonderTinder

func getFakeViewModel() -> WonderSuperHeroViewModel {
    let testModel1 = WonderSuperHeroModel(name: "test1", url: "")
    let testModel2 = WonderSuperHeroModel(name: "test2", url: "")
    let testViewModel = WonderSuperHeroViewModel(chars: [testModel1, testModel2])
    return testViewModel
}

