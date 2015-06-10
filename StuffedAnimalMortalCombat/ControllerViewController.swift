//
//  ControllerViewController.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/9/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

// Normal

// - directional pad
// - attack buttons
// - health bar?
// - points?
// - energy bar?
// - join and leave game buttons?

// Hard

// - skin selector? (maybe new view controller)
// - way to set your name?
// - way to approve invite ( alert view controller)


// Nightmare Mode

// - start connecting buttons to actions

class ControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Connector.defaultConnector().startAdvertising()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func joinGameButton(sender: UIButton) {
        
        let myPeerID = Connector.defaultConnector().session?.myPeerID
        Connector.defaultConnector().session?.nearbyConnectionDataForPeer(myPeerID, withCompletionHandler: { (NSData, NSError) -> Void in
            
            Connector.defaultConnector().session?.connectPeer(myPeerID, withNearbyConnectionData: NSData!)
        })
        
    }
    
    
    @IBAction func leaveGameButton(sender: UIButton) {
        
    //  Connector.defaultConnector().session?.cancelConnectPeer
        Connector.defaultConnector().session?.disconnect()
    }


}
