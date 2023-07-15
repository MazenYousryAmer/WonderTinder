//
//  NetworkManager.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

enum ServiceMethod: String {
    case get = "GET"
}

protocol BaseService {
    var path: String { get }
    var method: ServiceMethod { get }
    var parameters: [String: String] { get }
    var urlRequest : URLRequest { get }
}

extension BaseService {
    var urlRequest: URLRequest {
        var queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        var urlComponents = URLComponents(string: path)
        urlComponents?.queryItems = queryItems
        let urlAbsoluteString = urlComponents?.url?.absoluteString ?? ""
        return URLRequest(url: URL(string: urlAbsoluteString)! , cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10.0)
    }
}


