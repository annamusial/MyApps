//
//  CounterModel.swift
//  CounterApp
//
//  Created by Anna Musiał on 05.10.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import UIKit

class CounterModel: NSObject {
    var myCounter:Int!
    func current() -> Int{
        return myCounter
    }
}
