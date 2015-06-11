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
    @IBInspectable var cp1x: CGFloat = 10
    @IBInspectable var cp1y: CGFloat = 10
    @IBInspectable var cp2x: CGFloat = 30
    @IBInspectable var cp2y: CGFloat = 30
    @IBInspectable var pointX: CGFloat = 0
    @IBInspectable var pointY: CGFloat = 50
    @IBInspectable var linePointX: CGFloat = 30
    @IBInspectable var linePointY: CGFloat = 50
    @IBInspectable var movePointX: CGFloat = 0
    @IBInspectable var movePointY: CGFloat = 0
    
    
    
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        fillColor.setFill()
        
        let angle = CGFloat(DegreesToRadians(degrees))
        
        CGContextTranslateCTM(context, newOriginX, newOriginY)
        
        CGContextRotateCTM(context, angle)
        
        CGContextSetBlendMode(context, kCGBlendModeNormal)

    //  CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect))
        CGContextMoveToPoint(context, movePointX, movePointY)
    //  CGContextAddCurveToPoint(context, (CGRectGetMidX(rect) * 0.5), (CGRectGetMidY(rect) * 0.5), (CGRectGetMidX(rect) * 0.5), (CGRectGetMidY(rect) * 1.5), CGRectGetMinX(rect), CGRectGetMaxY(rect))
        CGContextAddCurveToPoint(context, cp1x, cp1y, cp2x, cp2y, pointX, pointY)
   //   CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMidY(rect))
        CGContextAddLineToPoint(context, linePointX, linePointY)
       
       
        CGContextFillPath(context)
        
       

    }


    
   
}
