//
//  FilmsViewController.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 02.11.2022.
//

import UIKit

class FilmsViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    var film: Films!
    
    private var spinnerView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = film.description
        descriptionLabel.textColor = .yellow

    }
    @IBAction func backToMenuButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let charactersVC = segue.destination as? CharacterTableViewController else { return }
        charactersVC.film = film
}
}
