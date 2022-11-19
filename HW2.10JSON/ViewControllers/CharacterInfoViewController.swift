//
//  CharacterInfoViewController.swift
//  HW2.10JSON
//
//  Created by Александр Соболев on 19.11.2022.
//

import UIKit

class CharacterInfoViewController: UIViewController {
    
    @IBOutlet weak var characterInfoLabel: UILabel!
    
    var characters: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterInfoLabel.text = characters.description
        characterInfoLabel.textColor = .yellow
    }
}
