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
    
    func fetchData(from url: String?, with completion: @escaping(Starships) -> Void) {
        guard let url = URL(string: Link.starWars.rawValue) else { return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
        }
            
            do{
                let starships = try JSONDecoder().decode(Starships.self, from: data)
                DispatchQueue.main.async {
                  completion(starships)
                }
            } catch let error {
                print(error)
                }
            }.resume()
    }
}
