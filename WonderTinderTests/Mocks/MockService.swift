//
//  MockService.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

enum MockService: BaseService {    
    case mock
}

extension MockService {
    var path: String { "www.apple.com" }
    var method: ServiceMethod { .get }
    var parameters: [String: String] {
        let params: [String: String] = ["test": "Mazen"]
        return params
    }
}
