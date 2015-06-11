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
