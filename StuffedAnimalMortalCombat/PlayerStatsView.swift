//
//  PlayerStatsView.swift
//  StuffedAnimalMortalCombat
//
//  Created by Christopher Wainwright Aaron on 6/12/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

class PlayerStatsView: UIView {

    @IBOutlet weak var healthBar: PointBarView!
 
    @IBOutlet weak var energyBar: PointBarView!
   
    @IBOutlet weak var statsKills: StatsKillsView!
    
    @IBOutlet weak var statsLives: StatsLivesView!

    @IBOutlet weak var playerName: UILabel!
}
