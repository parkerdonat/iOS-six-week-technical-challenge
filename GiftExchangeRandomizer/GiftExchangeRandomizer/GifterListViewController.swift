//
//  GifterListViewController.swift
//  GiftExchangeRandomizer
//
//  Created by Parker Donat on 3/11/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class GifterListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let kMargin = CGFloat(0.0)
    
//    var gifters = ["Parker", "Kaleo", "Daniel", "Caleb", "Parker", "Kaleo", "Daniel", "Caleb", "Parker", "Kaleo", "Daniel", "Caleb"]
    
    static var gifters = [Gifter]()
    
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
        
        // Determin how big our screen is
        
//        let viewWidth = view.frame.width
//        let viewWidthMinusMargin = viewWidth - 2 * kMargin
        
//        let itemDimensionWidth = viewWidthMinusMargin / 2.0 // determines how many cells are dsiplayed
        
//        
//        let viewHeight = view.frame.width
//        let viewHeightMinusMargin = viewHeight - 2 * kMargin
//        
//        let itemDemensionHeight = viewHeightMinusMargin
        
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
        
        return gifterCell
        
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}




 