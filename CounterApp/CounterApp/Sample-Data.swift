//
//  Sample-Data.swift
//  CounterApp
//
//  Created by Anna Musiał on 22.09.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import Foundation
import UIKit

//bad class name - dont use special characters like "-"


var playersData = [ //global variable is a bad idea in this case
    Player(name:"Anna Musial", company:"HD",score:0,myImageView:UIImage(named:"Flat-Camera-Icon")!),
    Player(name: "Mikolaj Stys", company: "iOS",score:0,myImageView: UIImage(named:"Flat-Camera-Icon")!),
    ]
//bad formatting - use spaces after ","
//Why there is a comma after last player? - remove it
