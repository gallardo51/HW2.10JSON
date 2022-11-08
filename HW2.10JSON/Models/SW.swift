//
//  SW.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

struct StarWarsFilms: Decodable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Films]
}

struct Films: Decodable {
    let title: String
    let episodeId: Int?
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let characters: [String]
    let planets: [String?]
    let starships: [String?]
    let vehicles: [String?]
    let species: [String]
    let created: String
    let edited: String
    let url: String?
    
    var description: String {
        """
    Title: \(title)
    
    Opening Crawl: \(openingCrawl)
    
    Director: \(director)
    
    Producer: \(producer)
    Release Date: \(releaseDate)
    Created: \(created)
    Edited: \(edited)
    """
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director = "director"
        case producer = "producer"
        case releaseDate = "release_date"
        case characters = "characters"
        case planets = "planets"
        case starships = "starships"
        case vehicles = "vehicles"
        case species = "species"
        case created = "created"
        case edited = "edited"
        case url = "url"
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
