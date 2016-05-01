//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Forrest Syrett on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var entryTitle: UITextField!
    @IBOutlet var entryTextField: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBAction func saveButton(sender: AnyObject) {
        
        if entryTitle.text == "" && entryTextField.text == "" { return }
        else {
        if let entry = self.entry {
            entry.title = self.entryTitle.text!
            entry.body = self.entryTextField.text
            entry.timeStamp = NSDate()
        } else {
            let newEntry = Entry(title: self.entryTitle.text!, body: self.entryTextField.text)
            EntryController.sharedEntryController.addEntry(newEntry)
            self.entry = newEntry
            entryTitleNavigationBar.title = entry?.title
            
        }
        }
        
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    @IBAction func clearTextButton(sender: AnyObject) {
        entryTitle.text = ""
        entryTextField.text = ""
    }
    
    
    @IBOutlet var entryTitleNavigationBar: UINavigationItem!
    
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        
        self.entryTitle.text = entry.title
        self.entryTextField.text = entry.body
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}