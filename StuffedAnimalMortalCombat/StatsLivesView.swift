//
//  StatsLivesView.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/12/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

@IBDesignable class StatsLivesView: UIView {

    @IBInspectable var lifeCount = 3 {
        
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var padding: CGFloat = 5
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let hw = rect.height
        
        for i in 0..<lifeCount {
            
            let x = rect.width - hw - ((hw + padding) * CGFloat(i))
            
            let lifeRect = CGRectMake(x, 0, hw, hw)
            
            CGContextFillEllipseInRect(context, lifeRect)
        }
    }
    
    
    


}
