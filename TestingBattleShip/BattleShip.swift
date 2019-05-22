//
//  BattleShip.swift
//  TestingBattleShip
//
//  Created by austin on 5/21/19.
//  Copyright © 2019 austin. All rights reserved.
//
// Note: This is our model sorta

import Foundation

struct BattleShipCell1 {
    
    //stored Properties
    var Ship: Bool = false
    
    var MissOrHit: String {
        
        if (Ship) {
            return "Hit"
        } else {
            return "Miss"
        }
        
        
    }
}

class BattleShip {
    
    
    var battleMapP1: [BattleShipCell1] = []
    static let battleMapP2: BattleShip = BattleShip(buildMap: true)
    
    
    init(buildMap: Bool) {
        if buildMap {
            battleMapP1 = [BattleShipCell1(Ship: true),BattleShipCell1(Ship: true),BattleShipCell1(Ship: true),BattleShipCell1(Ship: true),BattleShipCell1(Ship: true),BattleShipCell1(Ship: true),BattleShipCell1(Ship: true),BattleShipCell1(Ship: true),BattleShipCell1(Ship: true)]
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

