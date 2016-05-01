//
//  Entry.swift
//  Journal
//
//  Created by Forrest Syrett on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class Entry: Equatable {
    
    var timeStamp: NSDate
    var title: String
    var body: String
    
    
    init(timeStamp: NSDate = NSDate(), title: String, body: String) {
        
        self.timeStamp = timeStamp
        self.title = title
        self.body = body
    }
}
     func == (lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

