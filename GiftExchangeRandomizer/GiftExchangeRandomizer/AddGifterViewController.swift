//
//  AddGifterViewController.swift
//  GiftExchangeRandomizer
//
//  Created by Parker Donat on 3/11/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class AddGifterViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var gifter: Gifter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addGifterButtonTapped(sender: AnyObject) {
        if let gifter = self.gifter {
            gifter.name = self.textField.text!
        } else {
            let newName = Gifter(name: self.textField.text!)
            GifterController.sharedInstance.addName(newName)
            self.gifter = newName
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
        textField.text = ""
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func updateWithGifterName(name: Gifter) {
        self.gifter = name
        self.textField.text = name.name
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
