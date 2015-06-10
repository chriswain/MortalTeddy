//
//  HealthBarView.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/9/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

@IBDesignable class HealthBarView: UIView {
    
    @IBInspectable var fillColor: UIColor = UIColor.redColor()
    @IBInspectable var strokeColor: UIColor = UIColor.blackColor()
    @IBInspectable var strokeWidth: CGFloat = 3
    @IBInspectable var cornerRadius: CGFloat = 10
    
    @IBInspectable var healthPoints: CGFloat = 100
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let insetRect = CGRectInset(rect, strokeWidth / 2, strokeWidth / 2)
        
        var healthBar = UIBezierPath(roundedRect: insetRect, cornerRadius: cornerRadius)
        
        fillColor.setFill()
        strokeColor.setStroke()
        
        healthBar.fill()
        healthBar.stroke()
        
        healthBar.lineWidth = strokeWidth
        
    }

}
