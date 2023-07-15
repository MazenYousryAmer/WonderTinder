//
//  NetworkManager.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

protocol NetworkingService {
    func request(service: BaseService, completion: @escaping (MarvelCharacterModel?, Error?) -> Void)
}

class NetworkManager: NetworkingService {
    
    let session = URLSession.shared
    
    func request(service: BaseService, completion: @escaping (MarvelCharacterModel?, Error?) -> Void) {
        let dataTask = session.dataTask(with: service.urlRequest) {data , response , error in
            print("Data: \(String(describing: data))")
            print("response: \(String(describing: response))")
            print("error: \(String(describing: error))")
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, error)
                return
            }
            do {
                let model = try JSONDecoder().decode(MarvelCharacterModel.self, from: data)
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
}
