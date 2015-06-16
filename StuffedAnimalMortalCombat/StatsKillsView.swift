//
//  StatsKillsView.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/12/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

@IBDesignable class StatsKillsView: UIView {
    
    @IBInspectable var killCount: Int = 0 {
        
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var padding: CGFloat = 5
    @IBInspectable var color: UIColor = UIColor.blackColor()
    @IBInspectable var killsPerLine: CGFloat = 10
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let hw = (rect.width - ((killsPerLine - 1) * padding)) / killsPerLine
        
        color.set()
        
        for i in 0..<killCount {
            
            let x: CGFloat = (hw + padding) * (CGFloat(i) % killsPerLine)
            let y: CGFloat = (hw + padding) * floor(CGFloat(i) / killsPerLine)
            
            CGContextFillEllipseInRect(context, CGRectMake(x, y, hw, hw))
            
        }
        
        
    }
    
}
