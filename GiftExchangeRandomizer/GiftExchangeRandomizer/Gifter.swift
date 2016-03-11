//
//  Gifter.swift
//  GiftExchangeRandomizer
//
//  Created by Parker Donat on 3/11/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class Gifter: Equatable {
    
    private let kGifterName = "name"
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kGifterName] as? String else {
            self.name = ""
            
            return nil
        }
        
        self.name = name
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        let dictionary = [
            kGifterName : self.name
        ]
        return dictionary
    }
}

func == (lhs: Gifter, rhs: Gifter) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}

