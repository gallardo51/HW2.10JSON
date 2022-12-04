//
//  FilmsViewController.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 02.11.2022.
//

import UIKit

class FilmsViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Public properties
    var film: StarWarsFilms?
    var movie: Films!
    
    private var spinnerView = UIActivityIndicatorView()
    
    //MARK: - UI View controller methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = movie.description
        descriptionLabel.textColor = .yellow
        
    }
    
    @IBAction func backToMenuButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let charactersVC = segue.destination as? CharacterTableViewController else { return }
        charactersVC.film = movie
    }
}
