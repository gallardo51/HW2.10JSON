//
//  NetworkManager.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(StarWarsFilms) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            
            do {
                let films = try JSONDecoder().decode(StarWarsFilms.self, from: data)
                DispatchQueue.main.async {
                    completion(films)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    
    func fetchCharacter(from url: String, completion: @escaping(Result<Characters, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "no description")
                return
            }
            
            do {
                let character = try JSONDecoder().decode(Characters.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(character))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

