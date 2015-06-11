//
//  Functions.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/11/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

func DegreesToRadians (value: Double) -> Double {
    return value * M_PI / 180.0
}

func DistanceBetweenPoint1andPoint2(p1: CGPoint, p2: CGPoint) -> CGFloat {
    
    let xDist = (p2.x - p1.x)
    let yDist = (p2.y - p1.y)
    
    return sqrt((xDist * yDist) + (yDist * yDist))
}