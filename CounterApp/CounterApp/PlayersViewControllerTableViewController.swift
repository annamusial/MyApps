//
//  PlayersViewControllerTableViewController.swift
//  CounterApp
//
//  Created by Anna Musiał on 22.09.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import UIKit
import MobileCoreServices

class PlayersViewControllerTableViewController: UITableViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    var players:[Player] = playersData
    
    @IBOutlet weak var myImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! PlayerCell
        
        let player = players[indexPath.row] as Player
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = player.name
        }
        if let companyLabel = cell.viewWithTag(101) as? UILabel {
            companyLabel.text = player.company
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("You selected cell #\(indexPath.row)!")
        
        let alertController = UIAlertController(title: "What do you want to do?", message: "", preferredStyle: .Alert)
        
        let takePhoto = UIAlertAction(title: "Take photo", style: .Default){ (_) in
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .Camera
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
        }
      
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in
        }
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) == true {
            alertController.addAction(takePhoto)} else {
            print ("I don't have a camera.")
        }
        alertController.addAction(cancelAction)
        
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(
        picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject])
       
    {
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
