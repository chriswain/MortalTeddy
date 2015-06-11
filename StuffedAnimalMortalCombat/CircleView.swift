//
//  CircleView.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/10/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

@IBDesignable class CircleView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 40
    @IBInspectable let fillColor: UIColor = UIColor(red:0.16, green:0.82, blue:0.87, alpha:1)
    @IBInspectable let strokeWidth: CGFloat = 1
    @IBInspectable let strokeColor: UIColor = UIColor.clearColor()
    
    override func drawRect(rect: CGRect) {
        
       
        let insetRect = CGRectInset(rect, strokeWidth / 2, strokeWidth / 2)
        let circle = UIBezierPath(roundedRect: insetRect, cornerRadius: cornerRadius)
        
        fillColor.setFill()
        strokeColor.setStroke()
     
        
        circle.fill()
        circle.stroke()
       
     
    }
    

}
