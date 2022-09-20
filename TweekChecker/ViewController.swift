//
//  ViewController.swift
//  TweekChecker
//
//  Created by Sabyrzhan Tynybayev on 19.09.2022.
//

import Cocoa

class ViewController: NSViewController {
    
    lazy var touchIDSupportView: NSStackView = {
        let horizontalView = NSStackView()
        horizontalView.orientation = .horizontal
        horizontalView.distribution = .fillEqually
        horizontalView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = NSStackView()
        stackView.orientation = .horizontal
        stackView.distribution = .fillEqually
        
        let label = NSTextView()
        label.string = "TouchID auth"
        
        let toggle = NSSwitch()
        
        stackView.addSubview(label)
        stackView.addSubview(toggle)
        
        horizontalView.addSubview(stackView)
        
        return horizontalView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(touchIDSupportView)
        
        touchIDSupportView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        touchIDSupportView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        touchIDSupportView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        touchIDSupportView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 200))
    
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

