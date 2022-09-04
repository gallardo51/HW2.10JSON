//
//  SW.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

struct Starships: Decodable {
    let name: String?
    let manufacturer: String?
    let cost_in_credits: String?
    let lenght: String?
    let max_atmosphering_speed: String?
    let crew: String?
    let passengers: String?
    let url: String?
}

struct WebsiteDescription: Decodable {
    let count: Int?
    let next: String?
    let results: [Starships]
}

enum Link: String {
    case starWars = "https://swapi.dev/api/starships"
}
