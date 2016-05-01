//
//  EntryController.swift
//  Journal
//
//  Created by Forrest Syrett on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class EntryController {
    
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
}

/*     func createPlaylist(name: String) {
let playlist = Playlist(name: name)
playlists.append(playlist)
 */