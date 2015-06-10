//
//  EnergyBarView.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/10/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

@IBDesignable class EnergyBarView: UIView {
    
    @IBInspectable var fillColor: UIColor = UIColor.orangeColor()
    @IBInspectable var strokeColor: UIColor = UIColor.blackColor()
    @IBInspectable var strokeWidth: CGFloat = 3
    @IBInspectable var cornerRadius: CGFloat = 40
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let insetRect = CGRectInset(rect, strokeWidth / 2, strokeWidth / 2)
        var energy = UIBezierPath(roundedRect: insetRect, cornerRadius: cornerRadius)
        
        fillColor.setFill()
        strokeColor.setStroke()
        
        energy.fill()
        energy.stroke()
        energy.lineWidth = strokeWidth
    }

   

}
