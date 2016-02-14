//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Jay Iyer 2/13/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var dotButton: UIButton!
    @IBOutlet var dashButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var returnButton: UIButton!
    @IBOutlet var hideKeyboardButton: UIButton!
    
    var keyboardView: UIView!
    var text = ""

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        addDot()
        addDash()
        addDelete()
        addReturn()
    }
    
    func addDot() {
        dotButton = UIButton(type: .System) as UIButton
        dotButton.setTitle(".", forState: .Normal)
        dotButton.translatesAutoresizingMaskIntoConstraints = false
        dotButton.addTarget(self, action: "tappedDot", forControlEvents: .TouchUpInside)
        
        dotButton.titleLabel!.font = UIFont.systemFontOfSize(32)
        dotButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        dotButton.layer.cornerRadius = 5
        
        view.addSubview(dotButton)
        
        let dotCenterXConstraint = NSLayoutConstraint(item: dotButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: -50)
        let dotCenterYConstraint = NSLayoutConstraint(item: dotButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        view.addConstraints([dotCenterXConstraint, dotCenterYConstraint])
    }
    
    func tappedDot() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(".")
    }
    
    func addDash() {
        dashButton = UIButton(type: .System) as UIButton
        dashButton.setTitle("_", forState: .Normal)
        dashButton.translatesAutoresizingMaskIntoConstraints = false
        dashButton.addTarget(self, action: "tappedDash", forControlEvents: .TouchUpInside)
        
        dashButton.titleLabel!.font = UIFont.systemFontOfSize(32)
        dashButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        dashButton.layer.cornerRadius = 5
        
        view.addSubview(dashButton)
        
        let dashCenterXConstraint = NSLayoutConstraint(item: dashButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 50)
        let dashCenterYConstraint = NSLayoutConstraint(item: dashButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        view.addConstraints([dashCenterXConstraint, dashCenterYConstraint])
    }
    
    func tappedDash() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("_")
    }
    
    func addDelete() {
        deleteButton = UIButton(type: .System) as UIButton
        deleteButton.setTitle("Delete", forState: .Normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.addTarget(self, action: "tappedDelete", forControlEvents: .TouchUpInside)
        
        view.addSubview(deleteButton)
        
        let deleteRightSideConstraint = NSLayoutConstraint(item: deleteButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        let deleteTopConstraint = NSLayoutConstraint(item: deleteButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 10.0)
        view.addConstraints([deleteRightSideConstraint, deleteTopConstraint])
    }
    
    func tappedDelete() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    func addReturn() {
        returnButton = UIButton(type: .System) as UIButton
        returnButton.setTitle("Return", forState: .Normal)
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        returnButton.addTarget(self, action: "tappedReturn", forControlEvents: .TouchUpInside)
        
        view.addSubview(returnButton)
        
        let returnRightSideConstraint = NSLayoutConstraint(item: returnButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        let returnBottomConstraint = NSLayoutConstraint(item: returnButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        view.addConstraints([returnRightSideConstraint, returnBottomConstraint])
    }
    
    func tappedReturn() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("\n")
    }
}
