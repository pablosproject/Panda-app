//
//  NSPreferencePanelWindowController.swift
//  devMod
//
//  Created by Paolo Tagliani on 10/25/14.
//  Copyright (c) 2014 Paolo Tagliani. All rights reserved.
//

import Cocoa


class NSPreferencePanelWindowController: NSWindowController {

    @IBOutlet weak var launchAtStartupButton: NSButton!
    @IBOutlet weak var darkModeDatePicker: NSDatePicker!
    @IBOutlet weak var lightModeDatePicker: NSDatePicker!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        launchAtStartupButton.state = DevModeLoginItemManager.isCurrentApplicatonInLoginItems() ? NSOnState : NSOffState
    }
    
    @IBAction func launchLoginPressed(sender: NSButton) {
        if sender.state == NSOnState{
            DevModeLoginItemManager.addCurrentApplicatonToLoginItems()
        }
        else{
            DevModeLoginItemManager.removeCurrentApplicatonToLoginItems()
        }
    }
    
    @IBAction func darkTimeChange(sender: NSDatePicker) {
        let appDelegate = NSApplication.sharedApplication().delegate as AppDelegate
        appDelegate.darkTime = sender.dateValue
        NSUserDefaults.standardUserDefaults().setValue(sender.dateValue, forKey: "DarkTime")
    }
    
    @IBAction func lightTimeChange(sender: NSDatePicker) {
        let appDelegate = NSApplication.sharedApplication().delegate as AppDelegate
        appDelegate.lightTime = sender.dateValue
        NSUserDefaults.standardUserDefaults().setValue(sender.dateValue, forKey: "LightTime")
    }
    
}