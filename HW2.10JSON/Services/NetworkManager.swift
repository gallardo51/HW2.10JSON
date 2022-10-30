//
//  NetworkManager.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping([StarWarsFilms]) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            
            do {
                let lessons = try JSONDecoder().decode([StarWarsFilms].self, from: data)
                DispatchQueue.main.async {
                    completion(lessons)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
