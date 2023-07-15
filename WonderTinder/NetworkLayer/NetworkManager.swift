//
//  NetworkManager.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

protocol NetworkingService {
    func request(service: BaseService, completion: @escaping (MarvelCharacterModel, Error?) -> Void)
}

class NetworkManager: NetworkingService {
    
    let session = URLSession.shared
    //    var router: T? where T: BaseService
    
    //    func constructURL<T: BaseService>(service: T) -> URLRequest {
    //        var queryItems = [URLQueryItem]()
    //        for (key, value) in service.parameters {
    //            queryItems.append(URLQueryItem(name: key, value: value as? String))
    //        }
    //        var urlComponents = URLComponents(string: service.path)
    //        urlComponents?.queryItems = queryItems
    //        let urlAbsoluteString = urlComponents?.url?.absoluteString ?? ""
    //        return URLRequest(url: URL(string: urlAbsoluteString)! , cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10.0)
    //    }
    
    func request(service: BaseService, completion: @escaping (MarvelCharacterModel, Error?) -> Void) {
        let dataTask = session.dataTask(with: service.urlRequest) {data , response , error in
            DispatchQueue.main.async {
                print("Data: \(String(describing: data))")
                print("response: \(String(describing: response))")
                print("error: \(String(describing: error))")
                
                if error == nil
                            {
                                if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                                    let characters = self.parseData(data: data)
                                    print(characters)
//                                    onSuccess(photos ?? [])
                                }
                                else {
//                                    onFailure("fail")
                                }
                            }
                            else {
//                                onFailure("an error has occured")
                            }
                
                
            }
        }
        dataTask.resume()
    }
    
    func parseData(data : Data) -> MarvelCharacterModel? {
        do {
                let model = try JSONDecoder().decode(MarvelCharacterModel.self, from: data)
                return model
        }
        catch  {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    
}
