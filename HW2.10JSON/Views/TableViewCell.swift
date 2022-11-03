//
//  TableViewCell.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var nameFilmLabel: UILabel! {
    didSet {
        filmImage.contentMode = .scaleAspectFit
        filmImage.clipsToBounds = true
        filmImage.layer.cornerRadius = filmImage.frame.height / 2
    }
}

// MARK: - Public methods
    func configure(with films: Films?) {
        nameFilmLabel.text = films?.title
}
}
