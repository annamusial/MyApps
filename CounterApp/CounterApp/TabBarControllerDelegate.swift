//
//  TabBarControllerDelegate.swift
//  CounterApp
//
//  Created by Mikołaj Styś on 15.10.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import UIKit

//moved to separate file - its my fault - one class takes responsibility for itself and another one

class TabBarControllerDelegate: NSObject, UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print("Selected something!")
    if let controller = viewController as? ViewController {
      controller.lblScore.text = String(controller.counter)
    } else if let controller = viewController as? PlayersViewControllerTableViewController {
      controller.tableView?.reloadData()
      
    }
  }
}
