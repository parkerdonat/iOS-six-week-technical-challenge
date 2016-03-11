//
//  GifterController.swift
//  GiftExchangeRandomizer
//
//  Created by Parker Donat on 3/11/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class GifterController {
    
    private let kNameKey = "name"
    
    static let sharedInstance = GifterController()
    
    var nameEntries: [Gifter] = GifterListViewController.gifters
    
    init() {
        self.nameEntries = []

        self.loadFromPersistentStorage()
    }
    
    func addName(name: Gifter) {
        nameEntries.append(name)
        
        self.saveToPersistentStorage()
    }
    
    func removeName(name: Gifter) {
        
    }
    
    func loadFromPersistentStorage() {
        
    }
    
    func saveToPersistentStorage() {
        
    }
    
}