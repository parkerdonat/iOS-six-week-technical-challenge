//
//  GifterListViewController.swift
//  GiftExchangeRandomizer
//
//  Created by Parker Donat on 3/11/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit
//import GameKit

class GifterListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let kMargin = CGFloat(0.0)
    
    //    var gifters = ["Parker", "Kaleo", "Daniel", "Caleb", "Parker", "Kaleo", "Daniel", "Caleb", "Parker", "Kaleo", "Daniel", "Caleb"]
    
    //static var gifters = [Gifter]()
    //var randomGifter = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout.sectionInset = UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin)
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    
    @IBAction func editButtonPressed(sender: AnyObject) {
        
        if(self.navigationItem.leftBarButtonItem?.title == "Edit"){
            
            self.navigationItem.leftBarButtonItem?.title = "Done"
            
            for item in self.collectionView!.visibleCells() as! [GifterCollectionViewCell] {
                
                let indexPath : NSIndexPath = self.collectionView!.indexPathForCell(item as GifterCollectionViewCell)!
                let cell : GifterCollectionViewCell = self.collectionView!.cellForItemAtIndexPath(indexPath) as! GifterCollectionViewCell
                
                //Close Button
                let close : UIButton = cell.viewWithTag(102) as! UIButton
                close.hidden = false
            }
        } else {
            self.navigationItem.leftBarButtonItem?.title = "Edit"
            self.collectionView?.reloadData()
        }
    }
    
    @IBAction func randomizedButtonPressed(sender: AnyObject) {
        
//        self.performSegueWithIdentifier("toDetail", sender: self)
        GifterController.sharedInstance.shuffleNames()
        //GifterController.sharedInstance.randomArray()
        
    }
    
//    func getRandomName() -> String {
//        let randomize = GKRandomSource.sharedRandom().nextIntWithUpperBound(randomGifter.count)
//        
//        return randomGifter[randomize] as! String
//    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Add a Gifter", message: "Add a gifter's name to be randomized.", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Enter name here..."
            
            let defaultAction = UIAlertAction(title: "Cancel", style: .Cancel) { (alert) -> Void in
                
            }
            
            let okAction = UIAlertAction(title: "Add", style: .Default) { (alert) -> Void in
                
                let newName = Gifter(name: (alertController.textFields?.first?.text)!)
                GifterController.sharedInstance.addName(newName)
                
                self.collectionView.reloadData()
            }
            
            // add the actions to the view controller. Notice cancel will always be last.
            alertController.addAction(defaultAction)
            alertController.addAction(okAction)
            
            // you need to call the function to show the alert
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Collection View Delegate Flow Layout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(190, 50)
        
    }
    
    
    //MARK: - UICollectionView Data Source
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return GifterController.sharedInstance.nameEntries.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get cell back
        let gifterCell = collectionView.dequeueReusableCellWithReuseIdentifier("gifterCell", forIndexPath: indexPath) as! GifterCollectionViewCell
        
        // configure the cell
        let gifter = GifterController.sharedInstance.nameEntries[indexPath.item]
        gifterCell.gifterName.text = gifter.name
        
        gifterCell.gifterName.layer.masksToBounds = true
        gifterCell.gifterName.layer.cornerRadius = 8.0
        
        if self.navigationItem.leftBarButtonItem!.title == "Edit" {
            gifterCell.closeButton?.hidden = true
        } else {
            gifterCell.closeButton?.hidden = false
        }
        
        gifterCell.closeButton?.layer.setValue(indexPath.row, forKey: "index")
        
        gifterCell.closeButton?.addTarget(self, action: "deletePhoto:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return gifterCell
        
    }
    
    func deletePhoto(sender: UIButton) {
        let i: Int = (sender.layer.valueForKey("index")) as! Int
        
        GifterController.sharedInstance.removeNameAtIndex(i)
        
        self.collectionView!.reloadData()
    }

    
}