//
//  Avatar.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/10/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

@IBDesignable class Avatar: UIView {
    
    @IBInspectable var healthPoints: CGFloat = 60
    @IBInspectable var energyPoints: CGFloat = 80
    @IBInspectable var healthColor: UIColor = UIColor.greenColor()
    @IBInspectable var energyColor: UIColor = UIColor.purpleColor()
    @IBInspectable var lightHealth: UIColor = UIColor.lightGrayColor()
    @IBInspectable var lightEnergy: UIColor = UIColor.lightGrayColor()
    
    override func drawRect(rect: CGRect) {
        // piece of paper
        let context = UIGraphicsGetCurrentContext()
        
        //line width or bar width
        let lineWidth: CGFloat = 10
        CGContextSetLineWidth(context, lineWidth)
        
        // circle for bar
        let barRect = CGRectInset(rect, lineWidth / 2, lineWidth / 2)

        
        // left bar
        lightHealth.set()
        CGContextSetLineWidth(context, lineWidth)
        CGContextStrokeEllipseInRect(context, barRect)
        
        // right bar
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        lightEnergy.set()
        CGContextFillRect(context, CGRectMake(rect.width / 2, 0, rect.width / 2, rect.height))
        
        // remove other parts of circle
        CGContextSetBlendMode(context, kCGBlendModeClear)
        CGContextMoveToPoint(context, 0, 0) //tl
        CGContextAddLineToPoint(context, rect.width, 0) //tr
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2) //c
        CGContextAddLineToPoint(context, rect.width, rect.height) //br
        CGContextAddLineToPoint(context, 0, rect.height) //bl
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2) //c
        CGContextFillPath(context)
        
        // reset blend to normal
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        // add bar rounds ends
        addDotAtDegreesWithColorAndContext(-135, color: lightHealth, context: context)
        addDotAtDegreesWithColorAndContext(135, color: lightHealth, context: context)
        addDotAtDegreesWithColorAndContext(-45, color: lightEnergy, context: context)
        addDotAtDegreesWithColorAndContext(45, color: lightEnergy, context: context)
        
        // add current health
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        
        healthColor.set()
        
        let degrees = Double((healthPoints / 100) * 90 + 135)
        
        let angle = CGFloat(DegreesToRadians(degrees))

        
        let x = (rect.width / 2) + (rect.width) * cos(angle)
        let y = (rect.height / 2) + (rect.height) * sin(angle)

        
        CGContextMoveToPoint(context, x, y)
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2)
        CGContextAddLineToPoint(context, 0, rect.height)
        CGContextFillPath(context)
        
        addDotAtDegreesWithColorAndContext(degrees, color: healthColor, context: context)
        addDotAtDegreesWithColorAndContext(135, color: healthColor, context: context)

        // add current energy
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        
        energyColor.set()
        
        let oppoDegrees = Double(45 - ((energyPoints / 100) * 90))
        
        let oppoAngle = CGFloat(DegreesToRadians(oppoDegrees))
        
        
        let newX = (rect.width / 2) + (rect.width) * cos(oppoAngle)
        let newY = (rect.height / 2) + (rect.height) * sin(oppoAngle)
        
        
        CGContextMoveToPoint(context, newX, newY)
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2)
        CGContextAddLineToPoint(context, rect.width, rect.height)
        CGContextFillPath(context)
        
        addDotAtDegreesWithColorAndContext(oppoDegrees, color: energyColor, context: context)
        addDotAtDegreesWithColorAndContext(45, color: energyColor, context: context)

        
        CGContextSetBlendMode(context, kCGBlendModeNormal)

        
        // avatar circle
        UIColor.lightGrayColor().set()
        let avatarRect = CGRectInset(rect, 15, 15)
        CGContextFillEllipseInRect(context, avatarRect)
        
            }
    
    func addDotAtDegreesWithColorAndContext(degrees: Double,  color: UIColor,  context: CGContextRef) {
        
        
        let angle = CGFloat(DegreesToRadians(degrees))
        
        let x = (bounds.width / 2) + (bounds.width / 2 - 5) * cos(angle)
        let y = (bounds.height / 2) + (bounds.height / 2 - 5) * sin(angle)
        
        println("x \(x) y \(y)")
        
        color.set()
        CGContextSetLineCap(context, kCGLineCapRound)
        
        CGContextMoveToPoint(context, x, y)
        CGContextAddLineToPoint(context, x, y)
        
        CGContextStrokePath(context)

        
    }

   

}


