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
    var lastSelectedIndex: IndexPath?
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let player = players[(indexPath as NSIndexPath).row] as Player
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("You selected cell #\((indexPath as NSIndexPath).row)!")
        
        let alertController = UIAlertController(title: "What do you want to do?", message: "",preferredStyle: .alert)
        
        let takePhoto = UIAlertAction(title: "Take photo", style: .default){(_) in
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .camera
            self.lastSelectedIndex = indexPath
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {(_) in
        }
        
        let setActive = UIAlertAction(title:"Set as Active", style: .default){(_) in
                let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
                selectedCell.contentView.backgroundColor = UIColor.green
                self.isActive=true
        }
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) == true {
            alertController.addAction(takePhoto)} else {
            print ("I don't have a camera.")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(setActive)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]){
         print("Picked an image!")
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        players[(lastSelectedIndex! as NSIndexPath).row].myImageView = chosenImage
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
