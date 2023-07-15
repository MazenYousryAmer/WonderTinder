//
//  CharactersWorker.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

class CharactersWorker: NSObject {
    
    func fetchCharacters(completion: @escaping (MarvelCharacterModel?, Error?) -> Void) {
        let service = CharactersService.characters
        NetworkManager().request(service: service, completion: { charatersModel , error in
            print(charatersModel)
        })
    }
}
