//
//  EntryController.swift
//  Journal
//
//  Created by Forrest Syrett on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class EntryController {
    
    private let entriesKey = "entries"
    
    static let sharedEntryController = EntryController()
    
    
    var entries: [Entry]
    
    init() {
        self.entries = []
    }
    
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }
    
    func removeEntry(entry: Entry) {
        if let index = entries.indexOf(entry) {
            entries.removeAtIndex(index)
        }
        
    }
    
    func loadFromPersistentStorage() {
        
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [Dictionary<String, AnyObject>]
        
        if let entryDictionaries = entryDictionariesFromDefaults {
            
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        
        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
    }
    
}


