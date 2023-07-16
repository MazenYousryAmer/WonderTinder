//
//  WonderSuperHeroModel.swift
//  WonderTinder
//
//  Created by Mazen Amer on 15/07/2023.
//

import UIKit

class WonderSuperHeroModel: Codable {

    let name: String?
    let url: String?
    var isLiked: Bool? 
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    func like() {
        self.isLiked = true
    }
    
    func dislike() {
        self.isLiked = false
    }
}

class WonderSuperHeroViewModel: Codable {
    var allSuperheroCharaters: [WonderSuperHeroModel] = []
}
