//
//  AppDelegate.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/6/20.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
    var window: NSWindow!
    lazy var popover: NSPopover = {
        let contentView = ContentView()
        let popover = NSPopover()

        popover.contentSize = NSSize(width: 400, height: 400)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)

        return popover
    }()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let button = statusBarItem.button else { return }

        button.image = NSImage(named: "Icon")
        button.image?.isTemplate = true
        button.action = #selector(togglePopover(_:))

        getData()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    // MARK: - Private methods

    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusBarItem.button {
             if popover.isShown {
                  popover.performClose(sender)
             } else {
                  popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
             }
        }
    }

    func getData() {
        PurpleAirApi(sensorId: "67533").getData { (sensor) in
            debugPrint(sensor)
        }
    }
}
