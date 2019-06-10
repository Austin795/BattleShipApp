//
//  ViewController.swift
//  TestingBattleShip
//
//  Created by austin on 5/20/19.
//  Copyright © 2019 austin. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerOneViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var AudioPlayerMiss = AVAudioPlayer()
    var AudioPlayerHit = AVAudioPlayer()
    
    @IBOutlet weak var collectionViewA: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    
    @IBOutlet weak var endYourTurnBut: UIButton!
    @IBOutlet weak var mainMenuBack: UIButton!
    
    @IBOutlet weak var player1Title: UILabel!
    
    let collectionViewAIdentifier = "CollectionViewACell"
    let collectionViewBIdentifier = "CollectionViewBCell"
    
    var madeMove: Bool = false
    
    var items1 = BattleShip.battleMapPlayer1
   
    var items2 = BattleShip.battleMapPlayer2
    
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
        
        
        endYourTurnBut.layer.cornerRadius = 10
        endYourTurnBut.layer.borderWidth = 5
        endYourTurnBut.layer.borderColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
        
        player1Title.makeOutLine(oulineColor: UIColor.black, foregroundColor: UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1))
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
    
    @IBAction func backToMenu(_ sender: Any) {
        self.performSegue(withIdentifier: "player1ToMainMenu", sender: self)
        //wipe / make new maps when clicked
        // make button that has a load previous game
        // another button that if clicks byPass
        
    }
    
    @IBAction func toPassDevice1(_ sender: Any) {
        if(BattleShip.battleMapPlayer1.numShipTilesP1 == 0) {
            self.performSegue(withIdentifier: "winner1", sender: self)
        } else {
            self.performSegue(withIdentifier: "player1ToPassDevice", sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { // load collectionview display
        
        if (collectionView == self.collectionViewA) {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewAIdentifier, for: indexPath) as UICollectionViewCell
            
            
            let cellAtInt = BattleShip.battleMapPlayer1.getCellAt(BattleMapAt: indexPath.item)
            let resultA = BattleShip.battleMapPlayer1.checkIfHitOrMiss(Cell: cellAtInt)
         
            if (resultA) {
                cellA.backgroundColor = UIColor.lightGray
            }
     
            return cellA
            
            
        } else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewBIdentifier, for: indexPath) as UICollectionViewCell
            let cellAtInt = BattleShip.battleMapPlayer2.getCellAt(BattleMapAt: indexPath.item)
            
            
            let resultB = cellAtInt.userClicked
            
            //show or hide ships in enemy map
            if resultB {
                if ( BattleShip.battleMapPlayer2.getCellAt(BattleMapAt: indexPath.item).Ship ) {
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
        
        let cellAtInt = BattleShip.battleMapPlayer2.getCellAt(BattleMapAt: indexPath.item)
        
        let result = BattleShip.battleMapPlayer2.checkIfHitOrMiss(Cell: cellAtInt)
        
        
        
        if collectionView == self.collectionViewB {
            
            while(!madeMove) {
            
            if result {
                selectedCell.contentView.backgroundColor = UIColor.red
                BattleShip.battleMapPlayer2.setUserClicked(BattleMapAt: indexPath.item)
                AudioPlayerHit.play()
                BattleShip.battleMapPlayer1.minus(ShipTile: BattleShip.battleMapPlayer1)
                print(BattleShip.battleMapPlayer1.numShipTilesP1)
                
                
            } else {
                selectedCell.contentView.backgroundColor = UIColor.white
                BattleShip.battleMapPlayer2.setUserClicked(BattleMapAt: indexPath.item)
                AudioPlayerMiss.play()
            }
            madeMove = true
            print(indexPath.item, cellAtInt.MissOrHit, cellAtInt.userClicked)
            
            }
        } else {
            print(indexPath.item)
        }
      
    }

}
