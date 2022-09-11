//
//  SW.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//


struct NumberLessons: Decodable {
    let id: Int?
    let name: String?
    let date: String?
    let image: String?
    let link: String?
}

enum Link: String {
    case countLessons = "https://icodeschool.ru/json1.php"
}
