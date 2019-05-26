//
//  ViewController.swift
//  TestingBattleShip
//
//  Created by austin on 5/20/19.
//  Copyright © 2019 austin. All rights reserved.
//

import UIKit

class PlayerOneViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionViewA: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    
    @IBOutlet weak var mainMenuBack: UIButton!
    
    @IBOutlet weak var player1Title: UILabel!
    let collectionViewAIdentifier = "CollectionViewACell"
    let collectionViewBIdentifier = "CollectionViewBCell"
    
    
    
    
    let items1 = BattleShip.battleMapP2
    // ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19", "20","21","22","23","24","25","26","27", "28", "29", "30", "31", "32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50",
       //"51","52","53","54","55","56","57","58","59","60","61","62","63"]
    
    let items2 = BattleShip.battleMapP2
        // ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19", "20","21","22","23","24","25","26","27", "28", "29", "30", "31", "32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50",
                 // "51","52","53","54","55","56","57","58","59","60","61","62","63"]
    
    override func viewDidLoad() {
        // Initialize the collection views, set the desired frames
        
        collectionViewA.delegate = self
        collectionViewB.delegate = self
        
        collectionViewA.dataSource = self
        collectionViewB.dataSource = self
        
        self.view.addSubview(collectionViewA)
        self.view.addSubview(collectionViewB)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        
        player1Title.layer.backgroundColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
        player1Title.layer.cornerRadius = 10
        player1Title.layer.opacity = 0.8
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        self.performSegue(withIdentifier: "player1ToMainMenu", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewA {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewAIdentifier, for: indexPath) as UICollectionViewCell
            
            let cellAtInt = BattleShip.battleMapP2.getCellAt(BattleMapAt: indexPath.item)
            
            let result = BattleShip.battleMapP2.checkIfHitOrMiss(Cell: cellAtInt)
            
            let oceanBackground: UIImage! = UIImage(named: "Image")
            
            //self.collectionViewA.frame = CGRect(x: 0, y: 0, width: cellA.frame.width, height: collectionViewA.frame.height)
            
        
            
            self.collectionViewA.layer.borderWidth = 1.0
            self.collectionViewA.layer.borderColor = UIColor.black.cgColor
            
            //cellA.layer.borderWidth = 1.0
            //cellA.layer.borderColor = UIColor.black.cgColor
            
            self.collectionViewA.backgroundColor = UIColor.darkGray
            collectionViewA.layer.opacity = 0.8
            
            
            if ( result ) {
                cellA.backgroundColor = UIColor.red
            }
            
            
            // Set up cell
            return cellA
        }
            
        else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewBIdentifier, for: indexPath) as UICollectionViewCell
            
            // ...Set up cell
            
            return cellB
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewA {
            return BattleShip.battleMapP2.battleMapP1.count// Replace with count of your data for collectionViewA
        }
        
        return BattleShip.battleMapP2.battleMapP1.count // Replace with count of your data for collectionViewB
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        
        let cellAtInt = BattleShip.battleMapP2.getCellAt(BattleMapAt: indexPath.item)
        
        let result = BattleShip.battleMapP2.checkIfHitOrMiss(Cell: cellAtInt)
        
        if collectionView == self.collectionViewA {
            if result {
                selectedCell.contentView.backgroundColor = UIColor.red
 
            } else {
                selectedCell.contentView.backgroundColor = UIColor.white
            }
            
            print(indexPath.item)
            
        } else {
            if result {
                selectedCell.contentView.backgroundColor = UIColor.red
                
            } else {
                selectedCell.contentView.backgroundColor = UIColor.white
            }
            
            print(indexPath.item)
        }
      
    }

}
