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
    let CounterKey = "counter_key"
    var counter = 0
    
    @IBOutlet var lblShow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = NSUserDefaults.standardUserDefaults().integerForKey(CounterKey)
        lblScore.text = String(counter)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPressed() {
        counter += 1
        NSUserDefaults.standardUserDefaults().setInteger(counter, forKey: CounterKey)
        lblScore.text = String(counter)
    }
    
    @IBAction func zerujPressed(){
        counter = 0
        lblScore.text = String(counter)
        
    }


}




