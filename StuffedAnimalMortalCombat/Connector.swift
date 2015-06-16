//
//  Connector.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/9/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit
import MultipeerConnectivity

private let serviceType = "SAMK"

private let _singleton = Connector()

class Connector: NSObject, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate {
    
    class func defaultConnector() -> Connector { return _singleton }
    
    var browser: MCNearbyServiceBrowser? // ipad
    var advertiser: MCNearbyServiceAdvertiser? // iPhone
    var session: MCSession? // session of the connection
    var myPeerID: MCPeerID?
    var worldID: MCPeerID?
    var playersInfo: [String:AnyObject] = [:]
    var myInfo: [String:AnyObject] = [:]
        
//        "color" : UIColor.redColor()
//    ]
//    
    var gameBoard: GameViewController?
    var gameScene: GameScene?
    var controller: ControllerViewController?

    
    func startBrowsing() { //ipad
        
        myPeerID = MCPeerID(displayName: "World")
        
        session = MCSession(peer: myPeerID)
        session?.delegate = self
        
        browser = MCNearbyServiceBrowser(peer: myPeerID, serviceType: serviceType)
        browser?.delegate = self
        
        browser?.startBrowsingForPeers()
        
    }
    
    func startAdvertising() { //iPhone
        
        myPeerID = MCPeerID(displayName: "MonkeyDAse")
        
        session = MCSession(peer: myPeerID)
        session?.delegate = self
        
        advertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: myInfo, serviceType: serviceType)
        advertiser?.delegate = self
        
        advertiser?.startAdvertisingPeer()
        
    }
    
    ///// MARK: Browser Delegate
    
    func browser(browser: MCNearbyServiceBrowser!, foundPeer peerID: MCPeerID!, withDiscoveryInfo info: [NSObject : AnyObject]!) {
        
        println("found " + peerID.displayName)
        println("found info \(info)")
        
        playersInfo[peerID.displayName] = info
        
        browser.invitePeer(peerID, toSession: session, withContext: nil, timeout: 30)   
        
    }
    
    func browser(browser: MCNearbyServiceBrowser!, lostPeer peerID: MCPeerID!) {
        
        println("lost " + peerID.displayName)
        
    }
    
    ///// MARK: Advertiser Delegate
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
        println("invitation from " + peerID.displayName)
        
        worldID = peerID
        
        invitationHandler(true,session)
    }
    
   
    ///// MARK: Session Delegate
    
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        
        
        
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        
    }
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        decideActionWithData(data, andPeerID: peerID)
    }
    
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) {
        
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        
        let stateArray = [
            "Not Connected",
            "Connecting",
            "Connected"
        ]
        println("state \(stateArray[state.rawValue]) to " + peerID.displayName)
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
        
        switch state {
        
        case .NotConnected :
            
            self.gameBoard?.playerJoined(peerID)
        
        case .Connecting :
            
            println("\(stateArray[state.rawValue]) to " + peerID.displayName)
            
        case .Connected :
            
            self.gameBoard?.playerJoined(peerID)
            
            
            }
        })
    }
    
    ////////////////
    
    //////////////// MARK: DATA HANDlING
    
    func sendDataToWorld(data: NSData) {
        
        if let worldID = worldID {
            
            session?.sendData(data, toPeers: [worldID], withMode: MCSessionSendDataMode.Reliable, error: nil)
        }
    }
    
    func decideActionWithData(data: NSData, andPeerID peerID: MCPeerID) {
        
        if let info = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as? [String:AnyObject] {
            println(info)
            
            if let action = info["action"] as? String {
                if action == "jump" {
                    gameScene?.playerJump(peerID.displayName)
                }
            }
        }
    }
   
}
