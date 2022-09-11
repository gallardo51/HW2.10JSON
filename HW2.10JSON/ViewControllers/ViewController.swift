//
//  ViewController.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

import UIKit

class ViewController: UITableViewController {

    private var lessons: [NumberLessons] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 68
        tableView.backgroundColor = .gray
        
        fetchData(from: Link.countLessons.rawValue)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lessons.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let lesson = lessons[indexPath.row]
        cell.configure(with: lesson)
    
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { lessons in
            self.lessons = lessons
            self.tableView.reloadData()
        }
    }
}

