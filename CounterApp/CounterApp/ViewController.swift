//
//  ViewController.swift
//  CounterApp
//
//  Created by Anna Musiał on 04.09.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblScore: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPressed() {
        count += 1
        lblScore.text = String(count)
    }
    
    @IBAction func zerujPressed(){
        count = 0
        lblScore.text = String(count)
    }


}

