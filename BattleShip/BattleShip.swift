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
    var numShipTilesP1: Int = 14;
    var numShipTilesP2: Int = 14;
    
    let landMine = ship(shipSize: 1)
    let patrolBoat = ship(shipSize: 2)
    let destoryerBoat = ship(shipSize: 3)
    let battleshipBoat = ship(shipSize: 4)
    let aircraftBoat = ship(shipSize: 5)
    
    //shared Instances p1 and p2
    static var battleMapPlayer1: BattleShip = BattleShip(buildMap: true, PlayerNum: 1)
    static var battleMapPlayer2: BattleShip = BattleShip(buildMap: true, PlayerNum: 2)
    
    init(buildMap: Bool, PlayerNum: Int) {
        
        boatArr = [patrolBoat, destoryerBoat, battleshipBoat, aircraftBoat]
        
        var boatSelector: Int = 0
        //var boatSelected: ship
        var timesThough: Int = 0
        //let ranNumPlacer = Int.random(in: 7...10)
        let ranNumMatcher = Int.random(in: 3...10) // cellsBetweenPlacedShips
        
        if buildMap && PlayerNum == 1 { // player 1 Algo start
            var j:Int = 0
            //battleMapP1.append(BattleShipCell(Ship: true))
            for mapCell in 1...71 {
                if (j == ranNumMatcher && boatSelector < 4) {
                    //boatSelected = boatArr[boatSelector]
                    if (boatSelector == 0) {
                        if (j == 8 || j == 17) {
                            battleMapP1.append(BattleShipCell(Ship: false, userClicked: false))
                            for _ in 1...patrolBoat.shipSize {
                                battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                            }
                        } else {
                            for _ in 1...patrolBoat.shipSize {
                                battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                            }
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 1) {
                        if (mapCell == 16) {
                            battleMapP1.append(BattleShipCell(Ship: false, userClicked: false))
                            battleMapP1.append(BattleShipCell(Ship: false, userClicked: false))
                            for _ in 1...destoryerBoat.shipSize {
                                battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                                //battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                            }
                            boatSelector += 1
                            timesThough += 1
                        /*} else if ( mapCell == 17) {
                            var counter1 = mapCell
                            for _ in 1...destoryerBoat.shipSize {
                                counter1 += 1
                                battleMapP1.insert(BattleShipCell(Ship: true, userClicked: false), at: counter1)
                                //battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                            }
                            boatSelector += 1
                            timesThough += 1*/
                        } else {
                            for _ in 1...destoryerBoat.shipSize {
                                battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                            }
                            boatSelector += 1
                            timesThough += 1
                        }
                        
                    } else if (boatSelector == 2) {
                        for _ in 1...battleshipBoat.shipSize {
                            battleMapP1.append(BattleShipCell(Ship: true, userClicked: false))
                        }
                        boatSelector += 1
                        timesThough += 1
                    } else if (boatSelector == 3) {
                        for _ in 1...aircraftBoat.shipSize {
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
        // player 2 algo needs to be updated to do the same stuff as player 1 algo
        if buildMap && PlayerNum == 2 { // player 2 algo start
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
        } // if player 2 Algo end
    }
    
    func checkIfHitOrMiss(Cell: BattleShipCell) -> Bool {
        if Cell.Ship {
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
    
    func getUserClicked(Cell: BattleShipCell) -> Bool {
        if Cell.userClicked {
            return true
        } else {
            return false
        }
    }
    
    func getCellAt(BattleMapAt: Int) -> BattleShipCell {
        return battleMapP1[BattleMapAt]
    }
    
    func minus(ShipTile: BattleShip) {
        BattleShip.battleMapPlayer1.numShipTilesP1 = BattleShip.battleMapPlayer1.numShipTilesP1 - 1
    }
    
    
    
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

