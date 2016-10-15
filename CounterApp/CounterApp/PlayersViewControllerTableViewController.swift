//
//  PlayersViewControllerTableViewController.swift
//  CounterApp
//
//  Created by Anna Musiał on 22.09.2016.
//  Copyright © 2016 Anna Musiał. All rights reserved.
//

import UIKit
import MobileCoreServices //why do you need this import?

//your task:
//1. add photo functionality
//2. fix couter refresh
//3. fix cell selecting - now you can color more than one to green color


class PlayersViewControllerTableViewController: UITableViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate { //doubled ViewController element in name, bad extensions formatting
    
    var players:[Player] = playersData //add space after ":"
    var lastSelectedIndex: IndexPath?
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() { //remove unnecessary override
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    
    func viewDidAppear(animated: Bool) { //this was my poor impementation of refreshing after tab bar change 
      //- try to do it in TabBarControllerDelegate, beacuse currently couter in table is refreshed after onclick
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath as IndexPath) as! PlayerCell
        let player = players[(indexPath as IndexPath).row] as Player //indexPath as IndexPath - unnecessary cast
      
      //why do you setting cell attributes using two ways (didSet in Player cell and code below?)
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
        NSLog("You selected cell #\((indexPath as IndexPath).row)!") //use print or Log consequentely
        let alertController = UIAlertController(title: "What do you want to do?", message: "",preferredStyle: .alert)
        
        let takePhoto = UIAlertAction(title: "Take photo", style: .default){(_) in
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .camera
            self.lastSelectedIndex = indexPath
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {(_) in
        }
        
        let setActive = UIAlertAction(title:"Set as Active", style: .default){(_) in //space between ) { in all occurences
            //i think this is ugly formatting - try to remove brackets from "(_)" and move _ in to next line
          //do it in every occurence
            self.players[indexPath.row].isActive=true //bad formatting
            let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
            selectedCell.contentView.backgroundColor = UIColor.green
            let controller = self.navigationController?.tabBarController?.viewControllers?[0] as? ViewController
            controller?.counter=0 //bad formatting
            controller?.player = self.players[indexPath.row]
            
            for player in self.players {
                    print(player.score)
                    tableView.reloadData()
                }
        }
        tableView.reloadData()

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) == true {
          //why do you check the value of Bool in the if statement?
            alertController.addAction(takePhoto)
            } else {  //this is a catastrophic formatting
                print ("I don't have a camera.")
            }
            alertController.addAction(cancelAction)
            alertController.addAction(setActive)
      //it is very nice that you exported cancelAction and setActive to another variables - much cleaner
            self.present(alertController, animated: true, completion: nil) //self is unnecessary
        
    }

  //read the warning - signature is very similar to protocol method - ergo thats why you don't get the photo
    func imagePickerController(picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject]?){
        
        print("Picked an image!")
        
        let chosenImage = info?[UIImagePickerControllerOriginalImage] as! UIImage
        players[(lastSelectedIndex! as IndexPath).row].myImageView = chosenImage
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
     
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
