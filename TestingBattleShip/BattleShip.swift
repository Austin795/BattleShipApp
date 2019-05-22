//
//  BattleShip.swift
//  TestingBattleShip
//
//  Created by austin on 5/21/19.
//  Copyright © 2019 austin. All rights reserved.
//
// Note: This is our model sorta

import Foundation

struct BattleShipCell {
    
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
    
    
    var battleMapP1: [BattleShipCell] = []
    static let battleMapP2: BattleShip = BattleShip(buildMap: true)
    
    
    init(buildMap: Bool) {
        if buildMap {
            battleMapP1 = [BattleShipCell(Ship: false),BattleShipCell(Ship: true),BattleShipCell(Ship: true),BattleShipCell(Ship: false),BattleShipCell(Ship: false),BattleShipCell(Ship: true),BattleShipCell(Ship: false),BattleShipCell(Ship: true),BattleShipCell(Ship: true)]
        }
    }
    
    
    func checkIfHitOrMiss(Cell: BattleShipCell) -> Bool {
        
        if (Cell.Ship) {
            return true;
        } else {
            return false;
        }
        
    }
    
    func getCellAt(BattleMapAt: Int) -> BattleShipCell {
        
        return battleMapP1[BattleMapAt]
        
        
    }
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

