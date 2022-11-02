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
}
