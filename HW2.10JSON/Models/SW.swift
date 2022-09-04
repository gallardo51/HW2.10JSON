//
//  SW.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

struct WebsiteDescription: Decodable {
    let climate: String?
    let diameter: String?
    let name: String?
    let orbital_period: String?
    let population: String?
    let residents: [String]?
    let rotation: String?
    let surface: String?
    let terrain: String?
    let url: String?
}

enum Link: String {
    case starWars = "https://swapi.dev/api/"
}
