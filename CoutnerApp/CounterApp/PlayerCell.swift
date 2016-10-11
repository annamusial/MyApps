//
//  PlayerCell.swift
//  CounterApp
//
//  Created by Anna Musiał on 27.09.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var player: Player! {
        didSet {
            companyLabel.text = player.company
            nameLabel.text = player.name
            scoreLabel.text = String(player.score)
            myImageView.image = player.myImageView
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
