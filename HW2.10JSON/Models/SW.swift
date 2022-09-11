//
//  SW.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

struct Lessons: Decodable {
    let id: String?
    let name: String?
    let date: String?
    let image: String?
    let link: String?
}

enum Link: String {
    case countLessons = "https://icodeschool.ru/json1.php"
}
