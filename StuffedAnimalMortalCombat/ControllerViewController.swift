//
//  ControllerViewController.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/9/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

class ControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Connector.defaultConnector().controller = self
        Connector.defaultConnector().startAdvertising()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func pressedUp(sender: AnyObject) {
        
        
        let info = ["action":"jump"]
        
        if let data = NSJSONSerialization.dataWithJSONObject(info, options:NSJSONWritingOptions.allZeros, error: nil) {
            
            Connector.defaultConnector().sendDataToWorld(data)
        }
    }

    @IBAction func pressedLeft(sender: AnyObject) {
        
//        let info = ["action":"jump"]
//        
//        if let data = NSJSONSerialization.dataWithJSONObject(info, options:NSJSONWritingOptions.allZeros, error: nil) {
//            
//            Connector.defaultConnector().sendDataToWorld(data)
//        }
//
        
    }
   
    
    @IBAction func pressedRight(sender: AnyObject) {
    }
    
}
