//
//  NetworkManager.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation
import UIKit

protocol NetworkingService {
    func request<T: Codable>(service: BaseService, completion: @escaping (T?, Error?) -> Void)
}

class NetworkManager: NetworkingService {
    
    let session = URLSession.shared
    
    func request<T: Codable>(service: BaseService, completion: @escaping (T?, Error?) -> Void) {
        let dataTask = session.dataTask(with: service.urlRequest) {data , response , error in
            print("Data: \(String(describing: data))")
            print("response: \(String(describing: response))")
            print("error: \(String(describing: error))")
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, error)
                return
            }
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(model, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        dataTask.resume()
    }
    
    func request(url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        let dataTask = session.dataTask(with: url) { data, response , error in
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, error)
                return
            }
            let cachedData = CachedURLResponse(response: response, data: data)
            URLCache.shared.storeCachedResponse(cachedData, for: URLRequest(url: url))
            let image = UIImage(data: data)
            completion(image, nil)
        }
        dataTask.resume()
    }
    
}
