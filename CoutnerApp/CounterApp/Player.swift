//
//  Player.swift
//  CounterApp
//
//  Created by Anna Musiał on 22.09.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import UIKit

struct Player {
    var name: String?
    var company: String?
    var score: Int
    var myImageView: UIImage?
    
    init(name: String?, company: String?, score: Int, myImageView: UIImage) {
        self.name = name
        self.company = company
        self.score = score
        self.myImageView = myImageView
    }
}