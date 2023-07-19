//
//  MockService.swift
//  WonderTinderTests
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

enum MockService {
    case mock
}

extension MockService : BaseService {
    var path: String { "www.apple.com" }
    var method: ServiceMethod { .get }
    var parameters: [String: String] {
        return ["test": "Mazen"]
    }
}
