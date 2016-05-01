//
//  Entry.swift
//  Journal
//
//  Created by Forrest Syrett on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class Entry: Equatable {
    
    private let timestampKey = "timestamp"
    private let titleKey = "title"
    private let textKey = "text"
    
    var timeStamp: NSDate
    var title: String
    var body: String
    
    
    init(timeStamp: NSDate = NSDate(), title: String, body: String) {
        
        self.timeStamp = timeStamp
        self.title = title
        self.body = body
        
    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let timestamp = dictionary[timestampKey] as? NSDate,
            let title = dictionary[titleKey] as? String,
            let text = dictionary[textKey] as? String else {
                
                // sets values for stored properties due to requirement as of Swift 2.0
                self.timeStamp = NSDate()
                self.title = ""
                self.body = ""
                
                return nil
        }
        
        self.timeStamp = timestamp
        self.title = title
        self.body = text
        
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        
        let dictionary = [
            timestampKey : self.timeStamp,
            titleKey : self.title,
            textKey : self.body
        ]
        
        return dictionary
    }
        
}
     func == (lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

