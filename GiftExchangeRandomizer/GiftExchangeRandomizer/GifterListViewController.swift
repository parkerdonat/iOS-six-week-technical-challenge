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
    
    var gifters = ["Parker", "Kaleo", "Daniel", "Caleb", "Parker", "Kaleo", "Daniel", "Caleb", "Parker", "Kaleo", "Daniel", "Caleb"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout.sectionInset = UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin)
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
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
        
        return gifters.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get cell back
        let gifterCell = collectionView.dequeueReusableCellWithReuseIdentifier("gifterCell", forIndexPath: indexPath) as! GifterCollectionViewCell
        
        // configure the cell
        let gifter = gifters[indexPath.item]
        gifterCell.gifterName.text = gifter
        
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

 