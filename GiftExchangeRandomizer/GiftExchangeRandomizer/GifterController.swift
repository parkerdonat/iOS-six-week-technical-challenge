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
    
    var nameEntries: [Gifter] = []
    var randomName: [Gifter] = []
    
    init() {
        
        self.loadFromPersistentStorage()
        //self.randomArray()
        self.shuffleNames()
    }
    
    func addName(name: Gifter) {
        nameEntries.append(name)
        
        self.saveToPersistentStorage()
    }
    
    func removeNameAtIndex(index: Int) {
       
            nameEntries.removeAtIndex(index)
            
            self.saveToPersistentStorage()
    }
    
    func loadFromPersistentStorage() {
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kNameKey) as? [[String: AnyObject]]
        
        if let nameDictionaries = entryDictionariesFromDefaults {
            self.nameEntries = nameDictionaries.map({Gifter(dictionary: $0)!})
        }
        
    }
    
    func saveToPersistentStorage() {
        let nameDictionaries = self.nameEntries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(nameDictionaries, forKey: kNameKey)
    }
    
    // Another way to randomize array
    
        func shuffleArray<T>(var array: [T]) -> [T] {
            for index in (0..<array.count) {
                let randomIndex = Int(arc4random_uniform(UInt32(index)))
                (array[index], array[randomIndex]) = (array[randomIndex], array[index])
            }
    
            return array
        }
    
    
        func shuffleNames() {
            // call shuffle func and set to random names array
            randomName = shuffleArray(nameEntries)
        }
    
//    func randomArray() {
//        randomName = nameEntries
//        
//        for item in randomName {
//            if let index = randomName.indexOf(item) {
//                let randomIndex = Int(arc4random_uniform(UInt32(index + 2)))
//                let removedName = randomName.removeAtIndex(index)
//                randomName.insert(removedName, atIndex: randomIndex)
//                
//            }
//        }
//    }
    
}
