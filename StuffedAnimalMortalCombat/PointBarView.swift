//
//  PointBarView.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/11/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

@IBDesignable class PointBarView: UIView {
    
    @IBInspectable var points: CGFloat = 50
    @IBInspectable var fullColor: UIColor = UIColor.greenColor()
    @IBInspectable var lightColor: UIColor = UIColor.grayColor()
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let lineWidth: CGFloat = 10
        let cornerRadius: CGFloat = 5
       
        
//      CGContextSetLineWidth(context, lineWidth)
       
        let barRect = CGRectInset(rect, lineWidth / 2, lineWidth / 2)
        var pointsBar = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        
        CGContextSetLineWidth(context, lineWidth)
        
        lightColor.set()
        CGContextAddPath(context, pointsBar.CGPath)
        CGContextFillPath(context)
        
        fullColor.set()
    //    CGContextAddRect(context, CGRectMake(0, 0, rect.width - points, rect.height))
        
        CGContextFillRect(context, CGRectMake(0, 0, rect.width - points, rect.height))
        
       
        
        
        
    }
    

    


}
