//
//  AppDelegate.swift
//  TweekChecker
//
//  Created by Sabyrzhan Tynybayev on 19.09.2022.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    private var statusItem: NSStatusItem!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let statusButton = statusItem.button {
            statusButton.image = NSImage(systemSymbolName: "pawprint.circle", accessibilityDescription: "Paw")
        }
        
        setupMenus()
    }
    
    func setupMenus() {
            // 1
            let menu = NSMenu()

            // 2
            let one = NSMenuItem(title: "Check TouchID", action: #selector(didTapOne) , keyEquivalent: "1")
            menu.addItem(one)

            menu.addItem(NSMenuItem.separator())

            menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

            // 3
            statusItem.menu = menu
        }
    
        private func changeStatusBarButton(number: Int) {
            if let button = statusItem.button {
                button.image = NSImage(systemSymbolName: "\(number).circle", accessibilityDescription: number.description)
            }
        }

        @objc func didTapOne() {
            changeStatusBarButton(number: 1)
            if isPasswordBtTouchIDExists() {
                print("YES")
            } else {
                print("NO")
            }
        }
    
    func isPasswordBtTouchIDExists() -> Bool {
        do {
            let contents = try String(contentsOfFile: "/etc/pam.d/sudo")
            let lines = contents.split(separator:"\n")
            for line in lines {
                if line.contains("pam_tid.so") {
                    return true
                }
            }
            
            return false
        } catch {
            print("Error reading PAM file: \(error)")
            return false
        }
    }
    

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

