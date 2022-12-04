//
//  SW.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

struct StarWarsFilms {
    let count: Int?
    let next: String?
    let previous: String?
    let results: Films?
    
    init(value: [String: Any]) {
        count = value["count"] as? Int
        
        next = value["next"] as? String
        
        previous = value["previous"] as? String
        
        let resultsDict = value["results"] as? [String: Any] ?? [:]
        results = Films(value: resultsDict)
    }
    
    static func getFilms(from value: Any) -> [StarWarsFilms]? {
        guard let value = value as? [String : Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        return results.compactMap { StarWarsFilms(value: $0)}
    }
}
    
struct Films: Codable {
    let title: String?
    let episodeId: Int?
    let openingCrawl: String?
    let director: String?
    let producer: String?
    let releaseDate: String?
    let characters: [String]?
    let planets: [String?]?
    let starships: [String?]?
    let vehicles: [String?]?
    let species: [String]?
    let created: String?
    let edited: String?
    let url: String?
    
    init(value: [String: Any]) {
        title = value["title"] as? String
        
        episodeId = value["episode_id"] as? Int
        
        openingCrawl = value["opening_crawl"] as? String
        
        director = value["director"] as? String
        
        producer = value["producer"] as? String
        
        releaseDate = value["release_date"] as? String
        
        characters = value["characters"] as? [String]
        
        planets = value["planets"] as? [String]
        
        starships = value["starships"] as? [String]
        
        vehicles = value["vehicles"] as? [String]
        
        species = value["species"] as? [String]
        
        created = value["created"] as? String
        
        edited = value["edited"] as? String
        
        url = value["url"] as? String
        
    }
    
    var description: String {
        """
    Title: \(title ?? "")
    
    Opening Crawl: \(openingCrawl ?? "")
    
    Director: \(director ?? "")
    
    Producer: \(producer ?? "")
    Release Date: \(releaseDate ?? "")
    Created: \(created ?? "")
    Edited: \(edited ?? "")
    """
    }
}

struct Character: Decodable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    
    var description: String {
        """
    Name: \(name)
    
    Height: \(height)
    
    Mass: \(mass)
    
    Hair color: \(hairColor)
    
    Skin color: \(skinColor)
    
    Eye color: \(eyeColor)
    
    Birth year: \(birthYear)
    
    Gender: \(gender)
    """
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
        case mass = "mass"
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender = "gender"
    }
}

enum Link: String {
    case filmsSW = "https://swapi.dev/api/films/"
}
