//
//  PointBarView.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/11/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

@IBDesignable class PointBarView: UIView {
    
    @IBInspectable var points: CGFloat = 50 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    @IBInspectable var fullColor: UIColor = UIColor.greenColor()
    @IBInspectable var lightColor: UIColor = UIColor.grayColor()
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        lightColor.set()
        let lineWidth: CGFloat = 10
        let cornerRadius: CGFloat = rect.height / 2
       
        let pointsBar = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        
        CGContextAddPath(context, pointsBar.CGPath)
       
        CGContextFillPath(context)
        
        fullColor.set()
        
        let pointsWidth = points / 100 * rect.width
        let pointsRect = CGRectMake(0, 0, pointsWidth, rect.height)
        let pointsPath = UIBezierPath(roundedRect: pointsRect, cornerRadius: cornerRadius)
        
        
        
        
        CGContextAddPath(context, pointsPath.CGPath)
        
        CGContextFillPath(context)
        
       
        
        
        
    }
    

    


}
