//
//  CharactersWorker.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import Foundation

class CharactersWorker: NSObject {
//    var service: CharactersService?
    
    func getCharacters() {
        let service = CharactersService.characters
        NetworkManager().request(service: service, completion: { charatersModel , error in
            print(charatersModel)
        })
        
    }
    
//    private func getCharactersURL() -> URL {
//        let urlStr = "\(Constants.serverUrl)/characters"
//    }
//
//    func getCharacters() {
//
//    }
}
