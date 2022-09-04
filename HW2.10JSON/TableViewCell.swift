//
//  TableViewCell.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var starshipImage: UIImageView!
    @IBOutlet weak var nameStarshipLabel: UILabel! {
    didSet {
        starshipImage.contentMode = .scaleAspectFit
        starshipImage.clipsToBounds = true
        starshipImage.layer.cornerRadius = starshipImage.frame.height / 2
        starshipImage.backgroundColor = .white
    }
}

// MARK: - Public methods
func configure(with starship: Starships?) {
    nameStarshipLabel.text = starship?.name
    DispatchQueue.global().async {
        guard let stringUrl = starship?.url else { return }
        guard let imageUrl = URL(string: stringUrl) else { return }
        guard let imageData = try? Data(contentsOf: imageUrl) else { return }
        DispatchQueue.main.async {
            self.starshipImage.image = UIImage(data: imageData)
        }
    }
}
}
