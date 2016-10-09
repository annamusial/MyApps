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
    var isActive: Bool? = false
    var lastSelectedIndex: NSIndexPath?
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        if let nameLabel = cell.nameLabel {
            nameLabel.text = player.name
        }
        if let companyLabel = cell.companyLabel {
            companyLabel.text = player.company
        }
        
        if let scoreLabel = cell.scoreLabel {
            scoreLabel.text = String(player.score)
        }
        
        if let myImageView = cell.myImageView {
            myImageView.image = player.myImageView
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("You selected cell #\(indexPath.row)!")
        
        let alertController = UIAlertController(title: "What do you want to do?", message: "",preferredStyle: .Alert)
        
        let takePhoto = UIAlertAction(title: "Take photo", style: .Default){(_) in
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .Camera
            self.lastSelectedIndex = indexPath
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {(_) in
        }
        
        let setActive = UIAlertAction(title:"Set as Active", style: .Default){(_) in
                let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
                selectedCell.contentView.backgroundColor = UIColor.greenColor()
                self.isActive=true
        }
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) == true {
            alertController.addAction(takePhoto)} else {
            print ("I don't have a camera.")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(setActive)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject]){
         print("Picked an image!")
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        players[lastSelectedIndex!.row].myImageView = chosenImage
        
        tableView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
