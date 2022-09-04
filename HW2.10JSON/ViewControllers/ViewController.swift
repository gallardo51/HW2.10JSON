//
//  ViewController.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

import UIKit

class ViewController: UITableViewController {

    private var starships: Starships

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 40
        tableView.backgroundColor = .black
        
        fetchData(from: Link.starWars.rawValue)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { starships in
            self.starships = starships
            self.tableView.reloadData()
        }
    }
}

