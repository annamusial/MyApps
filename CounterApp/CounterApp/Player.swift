//
//  Player.swift
//  CounterApp
//
//  Created by Anna Musiał on 22.09.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import UIKit

class Player {
    var name: String?
    var company: String?
    var score: Int
    var myImageView: UIImage? //UIImageView is a different class than UIImage - it is misleading
    var isActive: Bool?
    
    init(name: String?, company: String?, score: Int, myImageView: UIImage) { //same misleading label for UIImage parameter
      //in init - score should be optional in case of nil - should be set to 0
        self.name = name
        self.company = company
        self.score = score
        self.myImageView = myImageView
        self.isActive = false
    }
}
