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
    var player: Player?
    
    @IBOutlet var lblShow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = UserDefaults.standard.integer(forKey: CounterKey)
        lblScore.text = String(counter)
    }
    
    override func viewDidAppear(_ _animated: Bool) {
        super.viewDidAppear(_animated)
        self.tabBarController!.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func buttonPressed() {
        counter += 1
        UserDefaults.standard.set(counter, forKey: CounterKey)
        player?.score = counter
        UserDefaults.standard.set(counter, forKey: CounterKey)
        lblScore.text = String(counter)
        if player?.isActive==true{
            player?.score=counter
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
        print("SELECTED STH!")
        if let controller = viewController as? ViewController {
            controller.lblScore.text = String(controller.player?.score ?? counter)
        } else if let controller = viewController as? PlayersViewControllerTableViewController {
            controller.tableView?.reloadData()
            
        }
    }
}




