//
//  TriangleButton.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/10/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

@IBDesignable class TriangleButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.whiteColor()
    @IBInspectable var strokeColor: UIColor = UIColor.whiteColor()
    @IBInspectable var lineWidth: CGFloat = 1
    @IBInspectable var degrees: Double = 360
    @IBInspectable var newOriginX: CGFloat = 0
    @IBInspectable var newOriginY: CGFloat = 0

    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        fillColor.setFill()

 //     CGContextSetBlendMode(context, kCGBlendModeClear)
        
        let angle = CGFloat(DegreesToRadians(degrees))
        
        CGContextTranslateCTM(context, newOriginX, newOriginY)
        
        CGContextRotateCTM(context, angle)
        
        CGContextSetBlendMode(context, kCGBlendModeNormal)

        CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect))
        CGContextAddCurveToPoint(context, (CGRectGetMidX(rect) * 0.5), (CGRectGetMidY(rect) * 0.5), (CGRectGetMidX(rect) * 0.5), (CGRectGetMidY(rect) * 1.5), CGRectGetMinX(rect), CGRectGetMaxY(rect))
 
        CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMidY(rect))
        
       
       
  //      CGContextClosePath(context)
        
   //     strokeColor.setStroke()
        CGContextFillPath(context)
        
       

    }


    
   
}
