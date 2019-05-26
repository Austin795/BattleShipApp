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

struct ship {
    var shipSize: Int = 0
}

class BattleShip {
    
    var battleMapP1: [BattleShipCell] = []
    var battleMapP2: [BattleShipCell] = []
    var boatArr: [ship] = []
    
    let landMine = ship(shipSize: 1)
    let patrolBoat = ship(shipSize: 2)
    let destoryerBoat = ship(shipSize: 3)
    let battleshipBoat = ship(shipSize: 4)
    let aircraftBoat = ship(shipSize: 5)
    
    static let battleMapP1: BattleShip = BattleShip(buildMap: true)
    static let battleMapP2: BattleShip = BattleShip(buildMap: true)
    
    init(buildMap: Bool) {
        
        boatArr = [patrolBoat, destoryerBoat, battleshipBoat, aircraftBoat]
        
        var boatSelector: Int = 0
        var boatSelected: ship
        var timesThough: Int = 0
        
        if buildMap {
            var j:Int = 0
            //battleMapP1.append(BattleShipCell(Ship: true))
            for _ in 1...71 {
                
                if (j == 9 && boatSelector < 4) {
                    
                    boatSelected = boatArr[boatSelector]
                    
                    if (boatSelector == 0) {
                        for _ in 1...patrolBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 1) {
                        for _ in 1...destoryerBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 2) {
                        for _ in 1...battleshipBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 3) {
                        for _ in 0...battleshipBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else {
                        break;
                    }
                    
                    
                    
                    /* if (boatSelector != 0) {
                        for _ in 1...boatSelected.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true))
                        }
                    } */
                        j = 0
                } else {
                    battleMapP1.append(BattleShipCell(Ship: false))
                    j += 1
                }

            }
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

