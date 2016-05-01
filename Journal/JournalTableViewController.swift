//
//  JournalTableViewController.swift
//  Journal
//
//  Created by Forrest Syrett on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class JournalTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    @IBOutlet var entryTableView: UITableView!
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return EntryController.sharedEntryController.entries.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryIdentifier", forIndexPath: indexPath)
        
        let entry = EntryController.sharedEntryController.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        
        // Date in detail text label
        
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        let convertedDate = dateFormatter.stringFromDate(currentDate)
        
        cell.detailTextLabel?.text = convertedDate
        
        
        
        // Configure the cell...

        return cell
    }

    

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let entry = EntryController.sharedEntryController.entries[indexPath.row]
            
            EntryController.sharedEntryController.removeEntry(entry)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toShowEntry" {
            if let detailViewController = segue.destinationViewController as? EntryDetailViewController {
                _ = detailViewController.view
                
                let indexPath = tableView.indexPathForSelectedRow
                if let selectedRow = indexPath?.row {
                    let entry = EntryController.sharedEntryController.entries[selectedRow]
                    detailViewController.updateWithEntry(entry)
                }
                
            }
        }
    }



}
