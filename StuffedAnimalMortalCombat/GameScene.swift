//
//  GameScene.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/9/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    let playerCount: CGFloat = 8
    let statsPadding: CGFloat = 20
    var playerStatsWidth: CGFloat!
    
    override func didMoveToView(view: SKView) {

        playerStatsWidth = (view.bounds.width - (statsPadding * (playerCount + 1))) / playerCount
        
        Connector.defaultConnector().gameScene = self 

    }
    
    func  playerJoined(name: String) {

        var playerNode = PlayerNode(color: UIColor.redColor(), size: CGSizeMake(40, 40))
        
        playerNode.name = name 
        
        playerNode.position = CGPointMake(500, 500)
        
        playerNode.physicsBody = SKPhysicsBody(rectangleOfSize: playerNode.size)
        
        if let info = Connector.defaultConnector().playersInfo[name] as? [String:AnyObject] {
            
            if let color = info["color"] as? UIColor {
                
                playerNode.color = color
            }
        }
        
        addChild(playerNode)
    }
    
    func playerLeft(name: String) {
        
        if let playerNode = childNodeWithName(name) {
            
            playerNode.removeFromParent()
        }
        
    }
    
    func playerJump(name: String) {
        
        if let playerNode = childNodeWithName(name) {
           
            playerNode.removeFromParent()
        }
        
    }
    
    func playerMove(name: String, withDirection direction: Int) {
        
        if let playerNode = childNodeWithName(name) {
            
            playerNode.physicsBody?.applyImpulse(CGVectorMake(0.0, 20))
        }
        
    }
    
    func playerStop(name: String) {
        
    }
    
  
    var sunRotation: Double = 0
   
    override func update(currentTime: CFTimeInterval) {
        
        
        
        if let sun = childNodeWithName("sun") {
          //  let radius = DistanceBetweenPoint1andPoint2(sun.position, view!.center)
            
            let radius = CGFloat(700)
            
            sunRotation = sunRotation < 360 ? sunRotation + 5 : 0
            
            let angle = CGFloat(DegreesToRadians(sunRotation))
            
            let x = position.x + radius * cos(angle)
            let y = position.y + radius * sin(angle)
            
            sun.position.x = x + view!.center.x
            sun.position.y = y + view!.center.y
        }
    }
}

class PlayerNode: SKSpriteNode {
    
    
}