//
//  ViewController.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    //MARK: - Private properties
    private var films: StarWarsFilms?
    
    //MARK: - UI View controller methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.backgroundColor = .black
        
        fetchData(from: Link.filmsSW.rawValue)
    }
    
    //MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let film = films?.results[indexPath.row]
        cell.configure(with: film)
        
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { films in
            self.films = films
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let film = films?.results[indexPath.row]
        let detailVC = segue.destination as! FilmsViewController
        detailVC.film = film
        
    }
}

