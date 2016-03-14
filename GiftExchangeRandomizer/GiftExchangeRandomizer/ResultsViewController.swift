//
//  ResultsViewController.swift
//  GiftExchangeRandomizer
//
//  Created by Parker Donat on 3/11/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    
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
        
        return GifterController.sharedInstance.randomName.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get cell back
        let resutCell = collectionView.dequeueReusableCellWithReuseIdentifier("resultCell", forIndexPath: indexPath) as! ResultsCollectionViewCell
        
        // configure the cell
        let gifter = GifterController.sharedInstance.randomName[indexPath.item]
        resutCell.resultLabel.text = gifter.name
        
        resutCell.resultLabel.layer.masksToBounds = true
        resutCell.resultLabel.layer.cornerRadius = 8.0
        
        return resutCell
        
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
