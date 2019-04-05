//
//  RecipesTableCell.swift
//  Gron
//
//  Created by Amélie Grosjean on 05/04/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import AlamofireImage

class RecipesTableCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var scoreRound: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

