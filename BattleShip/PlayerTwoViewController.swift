//
//  ViewController.swift
//  TestingBattleShip
//
//  Created by austin on 5/20/19.
//  Copyright © 2019 austin. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerTwoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var AudioPlayerMiss = AVAudioPlayer()
    var AudioPlayerHit = AVAudioPlayer()

    @IBOutlet weak var collectionViewA: UICollectionView!
    
    @IBOutlet weak var collectionViewB: UICollectionView!
    
    @IBOutlet weak var mainMenuBut2: NSLayoutConstraint!
    @IBOutlet weak var endYourTurnBut2: UIButton!
   
    @IBOutlet weak var player2Title: UILabel!
    
    let collectionViewAIdentifier = "CollectionViewACell"
    let collectionViewBIdentifier = "CollectionViewBCell"
    
    var madeMove: Bool = false
    
    let items1 = BattleShip.battleMapPlayer1
    let items2 = BattleShip.battleMapPlayer2
    
    @IBOutlet weak var playerNumLabel: UILabel!
    
    override func viewDidLoad() {
        // Initialize the collection views, set the desired frames
        
        collectionViewA.delegate = self
        collectionViewB.delegate = self
        
        collectionViewA.dataSource = self
        collectionViewB.dataSource = self
        
        self.view.addSubview(collectionViewA)
        self.view.addSubview(collectionViewB)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        
        
        endYourTurnBut2.layer.cornerRadius = 10
        endYourTurnBut2.layer.borderWidth = 5
        endYourTurnBut2.layer.borderColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
        
        player2Title.makeOutLine(oulineColor: UIColor.black, foregroundColor: UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1))
        //playerNumLabel.makeOutLine(oulineColor: UIColor.black, foregroundColor: UIColor.white)
        
        self.collectionViewA.layer.borderWidth = 1.0
        self.collectionViewA.layer.borderColor = UIColor.black.cgColor
        
        self.collectionViewB.layer.borderWidth = 1.0
        self.collectionViewB.layer.borderColor = UIColor.black.cgColor
        
        let AssortedMusicMiss = NSURL(fileURLWithPath: Bundle.main.path(forResource: "MissSplash", ofType: "mp3")!)
        
        AudioPlayerMiss = try! AVAudioPlayer(contentsOf: AssortedMusicMiss as URL)
        
        AudioPlayerMiss.prepareToPlay()
        
        let AssortedMusicHit = NSURL(fileURLWithPath: Bundle.main.path(forResource: "HitCannon", ofType: "mp3")!)
        
        AudioPlayerHit = try! AVAudioPlayer(contentsOf: AssortedMusicHit as URL)
        
        AudioPlayerHit.prepareToPlay()
        
        
        
        
    }
    
    
    @IBAction func backToMenu(_ sender: UIButton) {
        
        performSegue(withIdentifier: "player2ToMainMenu", sender: self)
    }
    
   
    @IBAction func passDevice2(_ sender: Any) {
        if(BattleShip.battleMapPlayer1.numShipTilesP1 == 0) {
            self.performSegue(withIdentifier: "winner2", sender: self)
        } else {
            self.performSegue(withIdentifier: "player2ToPassDevice", sender: self)
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.collectionViewA) {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewAIdentifier, for: indexPath) as UICollectionViewCell
            
            let cellAtInt = BattleShip.battleMapPlayer2.getCellAt(BattleMapAt: indexPath.item)
            let resultA = BattleShip.battleMapPlayer2.checkIfHitOrMiss(Cell: cellAtInt)
            
            if ( resultA ) {
                cellA.backgroundColor = UIColor.lightGray
            }
            return cellA
            
            
        } else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewBIdentifier, for: indexPath) as UICollectionViewCell
            let cellAtInt = BattleShip.battleMapPlayer1.getCellAt(BattleMapAt: indexPath.item)
            
            //let resultB = BattleShip.battleMapPlayer1.checkIfHitOrMiss(Cell: cellAtInt)
            
            //show or hide ships in enemy map
            let resultB = cellAtInt.userClicked
 
            if resultB {
                if ( BattleShip.battleMapPlayer1.getCellAt(BattleMapAt: indexPath.item).Ship ) {
                    cellB.backgroundColor = UIColor.red
                } else {
                    cellB.backgroundColor = UIColor.white
                }
            }
            
            return cellB
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewA {
            return BattleShip.battleMapPlayer1.battleMapP1.count
        }
        
        return BattleShip.battleMapPlayer2.battleMapP1.count // Replace with count of your data for collectionViewB
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { // if cell clicked
        
        let selectedCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        
        let cellAtInt = BattleShip.battleMapPlayer1.getCellAt(BattleMapAt: indexPath.item)
        
        let result = BattleShip.battleMapPlayer1.checkIfHitOrMiss(Cell: cellAtInt)
        
        if collectionView == self.collectionViewB {
            
            while(!madeMove) {
                
            if result {
                selectedCell.contentView.backgroundColor = UIColor.red
                BattleShip.battleMapPlayer1.setUserClicked(BattleMapAt: indexPath.item)
                AudioPlayerHit.play()
                BattleShip.battleMapPlayer2.minus(ShipTile: BattleShip.battleMapPlayer2)
                print(BattleShip.battleMapPlayer2.numShipTilesP2)
            
                
            } else {
                selectedCell.contentView.backgroundColor = UIColor.white
                BattleShip.battleMapPlayer1.setUserClicked(BattleMapAt: indexPath.item)
                AudioPlayerMiss.play()
            }
            
            madeMove = true
            print(indexPath.item, cellAtInt.MissOrHit, cellAtInt.userClicked)
            
            }
        } else {
            /* if result {
                selectedCell.contentView.backgroundColor = UIColor.red
                
            } else {
                selectedCell.contentView.backgroundColor = UIColor.white
            } */
            
            print(indexPath.item)
        }
        
    }
    
}
