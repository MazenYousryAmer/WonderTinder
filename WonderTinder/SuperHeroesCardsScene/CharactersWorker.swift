//
//  CharactersWorker.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

class CharactersWorker {
    func fetchCharacters(service: BaseService, completion: @escaping (MarvelCharacterModel?, Error?) -> Void) {
        NetworkManager().request(service: service, completion: { charatersModel , error in
            if let error = error {
                completion(nil, error)
            } else {
                completion(charatersModel, nil)
            }
        })
    }
}
