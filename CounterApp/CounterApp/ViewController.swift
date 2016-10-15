//
//  ViewController.swift
//  CounterApp
//
//  Created by Anna Musiał on 04.09.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import UIKit

//try to center jacek's head in this view

class ViewController: UIViewController {
    
    @IBOutlet var lblScore: UILabel! // try not to use something like "lbl" "sb" "sth" and "a"
    let CounterKey = "counter_key"
    var counter = 0
    var player: Player?
    
    @IBOutlet var lblShow: UILabel! //maybe you should group variables with the same origin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = UserDefaults.standard.integer(forKey: CounterKey)
        lblScore.text = String(counter)
        tabBarController?.delegate = self //My bad - used "!" and self
    }

    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

    }
  
    override func didReceiveMemoryWarning() { //empty override - remove
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func buttonPressed() {
        counter += 1
        UserDefaults.standard.set(counter, forKey: CounterKey) //doubled method call
        player?.score = counter
        UserDefaults.standard.set(counter, forKey: CounterKey)
        lblScore.text = String(counter)
        if player?.isActive==true{ //badly formatted
            player?.score=counter //badly formatted
            print(player?.score)
        }
    }
    
    @IBAction func zerujPressed(){
        counter = 0
        lblScore.text = String(counter)
    }
    
}

extension ViewController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print("Selected something!")
    if let controller = viewController as? ViewController {
      controller.lblScore.text = String(controller.counter)
    } else if let controller = viewController as? PlayersViewControllerTableViewController {
      controller.tableView?.reloadData()
      
    }
  }
}
