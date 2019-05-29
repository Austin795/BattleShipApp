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
    var userClicked: Bool = false
    var MissOrHit: String {
        if (Ship) {
            return "Hit"
        } else {
            return "Miss"
        }
    }
}

struct ship {
    //stored properties
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
    
    static let battleMapPlayer1: BattleShip = BattleShip(buildMap: true, PlayerNum: 1)
    static let battleMapPlayer2: BattleShip = BattleShip(buildMap: true, PlayerNum: 2)
    
    init(buildMap: Bool, PlayerNum: Int) {
        
        boatArr = [patrolBoat, destoryerBoat, battleshipBoat, aircraftBoat]
        
        var boatSelector: Int = 0
        //var boatSelected: ship
        var timesThough: Int = 0
        
        //let ranNumPlacer = Int.random(in: 7...10)
        let ranNumMatcher = Int.random(in: 7...10)
        
        
        if buildMap && PlayerNum == 1 { // player 1 Algo start
            var j:Int = 0
            //battleMapP1.append(BattleShipCell(Ship: true))
            for _ in 1...71 {
                if (j == ranNumMatcher && boatSelector < 4) {
                    
                    //boatSelected = boatArr[boatSelector]
                    
                    if (boatSelector == 0) {
                        for _ in 1...patrolBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 1) {
                        for _ in 1...destoryerBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 2) {
                        for _ in 1...battleshipBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 3) {
                        for _ in 0...battleshipBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else {
                        break;
                    }
                    j = 0
                } else {
                    battleMapP1.append(BattleShipCell(Ship: false, userClicked: false))
                    j += 1
                }

            }
        } // if player 1 Algo end
        
        if buildMap && PlayerNum == 2 { // player 2 algo start
            var j:Int = 0
            //battleMapP1.append(BattleShipCell(Ship: true))
            for _ in 1...71 {
                if (j == 9 && boatSelector < 4) {
                    
                    //boatSelected = boatArr[boatSelector]
                    
                    if (boatSelector == 0) {
                        for _ in 1...patrolBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 1) {
                        for _ in 1...destoryerBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 2) {
                        for _ in 1...battleshipBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 3) {
                        for _ in 0...battleshipBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else {
                        break;
                    }
                    j = 0
                } else {
                    battleMapP1.append(BattleShipCell(Ship: false, userClicked: false))
                    j += 1
                }
                
            }
        } // if player 2 Algo end
    }
    
    func checkIfHitOrMiss(Cell: BattleShipCell) -> Bool {
        
        if (Cell.Ship) {
            return true;
        } else {
            return false;
        }
        
    }
    
    func setHit(BattleMapAt: Int)  {
         battleMapP1[BattleMapAt].Ship = true
    }
    
    func setMiss(BattleMapAt: Int)  {
        battleMapP1[BattleMapAt].Ship = false
    }
    
    func setUserClicked(BattleMapAt: Int) {
        battleMapP1[BattleMapAt].userClicked = true
    }
    
    func setUserClickedP2(BattleMapAt: Int) {
        battleMapP2[BattleMapAt].userClicked = true
    }
    
    
    func getCellAt(BattleMapAt: Int) -> BattleShipCell {
        
        return battleMapP1[BattleMapAt]
        
        
    }
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

