//
//  CharactersModel.swift
//  WonderTinder
//
//  Created by Mazen Amer on 15/07/2023.
//

import Foundation

struct Items : Codable {
    let resourceURI : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case resourceURI = "resourceURI"
        case name = "name"
    }
}

struct Comics : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [Items]?
    let returned : Int?

    enum CodingKeys: String, CodingKey {

        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }
}

struct DataResult : Codable {
    let offset : Int?
    let limit : Int?
    let total : Int?
    let count : Int?
    let results : [Results]?

    enum CodingKeys: String, CodingKey {

        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }
}

struct Events : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [Items]?
    let returned : Int?

    enum CodingKeys: String, CodingKey {

        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }
}

struct Urls : Codable {
    let type : String?
    let url : String?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case url = "url"
    }
}

struct MarvelCharacterModel : Codable {
    let code : Int?
    let status : String?
    let copyright : String?
    let attributionText : String?
    let attributionHTML : String?
    let etag : String?
    let data : DataResult?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case status = "status"
        case copyright = "copyright"
        case attributionText = "attributionText"
        case attributionHTML = "attributionHTML"
        case etag = "etag"
        case data = "data"
    }
}


struct Results : Codable {
    let id : Int?
    let name : String?
    let description : String?
    let modified : String?
    let thumbnail : Thumbnail?
    let resourceURI : String?
    let comics : Comics?
    let series : Series?
    let stories : Stories?
    let events : Events?
    let urls : [Urls]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case description = "description"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case resourceURI = "resourceURI"
        case comics = "comics"
        case series = "series"
        case stories = "stories"
        case events = "events"
        case urls = "urls"
        
    }
}

struct Series : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [Items]?
    let returned : Int?

    enum CodingKeys: String, CodingKey {

        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        available = try values.decodeIfPresent(Int.self, forKey: .available)
        collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
        returned = try values.decodeIfPresent(Int.self, forKey: .returned)
    }
}


struct Stories : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [Items]?
    let returned : Int?

    enum CodingKeys: String, CodingKey {

        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }
}

struct Thumbnail : Codable {
    let path : String?
    let `extension` : String?

    enum CodingKeys: String, CodingKey {

        case path = "path"
        case `extension` = "extension"
    }
}


