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
        if let nameIndex = nameEntries.indexOf(name) {
            nameEntries.removeAtIndex(nameIndex)
            
            self.saveToPersistentStorage()
        }
    }
    
    func loadFromPersistentStorage() {
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kNameKey) as? [[String: AnyObject]]
        
        if let entryDictionaries = entryDictionariesFromDefaults {
            self.nameEntries = entryDictionaries.map({Gifter(dictionary: $0)!})
        }
        
    }
    
    func saveToPersistentStorage() {
        let entryDictionaries = self.nameEntries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: kNameKey)
    }
    
}