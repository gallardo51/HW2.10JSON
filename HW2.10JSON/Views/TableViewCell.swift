//
//  TableViewCell.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 04.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lessonImage: UIImageView!
    @IBOutlet weak var nameLessonLabel: UILabel! {
    didSet {
        lessonImage.contentMode = .scaleAspectFit
        lessonImage.clipsToBounds = true
        lessonImage.layer.cornerRadius = lessonImage.frame.height / 2
        lessonImage.backgroundColor = .orange
    }
}

// MARK: - Public methods
    func configure(with numberLessons: NumberLessons) {
        nameLessonLabel.text = numberLessons.name
    DispatchQueue.global().async {
        guard let stringUrl = numberLessons.image else { return }
        guard let imageUrl = URL(string: stringUrl) else { return }
        guard let imageData = try? Data(contentsOf: imageUrl) else { return }
        DispatchQueue.main.async {
            self.lessonImage.image = UIImage(data: imageData)
        }
    }
}
}
