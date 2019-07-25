//
//  AppDelegate.swift
//  KAKALocalLanguageFormat
//
//  Created by  on 2019/7/25.
//  Copyright © 2019 kakamove. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var englishTestField: NSTextField!
    @IBOutlet weak var otherLaunguageTextField: NSTextField!
    @IBOutlet weak var convertButton: NSButton!
    
    
    var result = ""
    let pop = NSPopover()
    let tipViewController = TipViewController()
    
    @IBAction func clickConvert(_ sender: Any) {
        
        let english  = englishTestField.stringValue
        let englishs =  english.components(separatedBy: "\n")
//        print(englishs)
        let other   = otherLaunguageTextField.stringValue
        let others  =  other.components(separatedBy: "\n")
//        print(others)
        
        let count = englishs.count
        var results: [String] = []
        for i in 0..<count {
            let aResultSub1 = "\"\(englishs[i])\""
            let aResultSub2 = "\"\(others[i])\""
            let aResultSub3 = ";"
            let aResult = "\(aResultSub1) = \(aResultSub2)\(aResultSub3)"
            results.append(aResult)
        }
        
        result = results.joined(separator: "\n")
        print(result)
        
        let paste = NSPasteboard.general
        paste.clearContents()
        paste.writeObjects([result as NSPasteboardWriting])
        
        
        pop.contentViewController =  tipViewController
        pop.animates = true
        pop.behavior = .transient
        pop.show(relativeTo: convertButton.bounds, of: convertButton, preferredEdge: .minY)
        
    }
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

