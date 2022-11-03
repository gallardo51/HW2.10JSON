//
//  CharacterViewController.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 02.11.2022.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    var film: Films!
    var characters: [Characters] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 70
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        film.characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)

        var content = cell.defaultContentConfiguration()
        let characterURL = film.characters[indexPath.row]
        content.textProperties.color = .black
        NetworkManager.shared.fetchCharacter(from: characterURL) { result in
            switch result {
            case .success(let character):
                self.characters.append(character)
                content.text = character.name
                cell.contentConfiguration = content
            case .failure(let error):
                print(error)
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        performSegue(withIdentifier: "showEpisode", sender: character)
    }
}

