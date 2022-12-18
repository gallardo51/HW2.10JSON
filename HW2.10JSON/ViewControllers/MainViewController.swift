//
//  ViewController.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    //MARK: - Private properties
    private var films: [StarWarsFilms] = []
    
    //MARK: - UI View controller methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.backgroundColor = .black
        
        fetchData(from: Link.filmsSW.rawValue)
    }
    
    //MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let film = films[indexPath.row]
        content.text = film.results?.title
        cell.contentConfiguration = content
        
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData { films in
            self.films = films
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let film = films[indexPath.row]
        let detailVC = segue.destination as! FilmsViewController
        detailVC.film = film
        
    }
}

