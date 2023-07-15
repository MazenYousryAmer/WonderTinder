//
//  CharacterService.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation


enum CharactersService {
    case characters
}

extension CharactersService: BaseService {
    var path: String { "\(Constants.serverUrl)/characters" }
    var method: ServiceMethod { .get }
    var parameters: [String: String] {
        let params: [String: String] = ["ts":"\(Int((Date().timeIntervalSince1970 * 1000.0)))","apikey": Constants.publicKey, "hash": MD5Hex(string: "\(Int((Date().timeIntervalSince1970 * 1000.0)))\(Constants.privateKey)\(Constants.publicKey)")]
        return params
    }
}

//let privateKeyMd5 = MD5Hex(string: "\(Int((Date().timeIntervalSince1970 * 1000.0)))\(Constants.privateKey)\(Constants.publicKey)")




