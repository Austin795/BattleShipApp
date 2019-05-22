//
//  ViewController.swift
//  TestingBattleShip
//
//  Created by austin on 5/20/19.
//  Copyright © 2019 austin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet weak var collectionViewA: UICollectionView!
    
    @IBOutlet weak var collectionViewB: UICollectionView!
    
    //let collectionViewA = UICollectionView()
    //let collectionViewB = UICollectionView()
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
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewA {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewAIdentifier, for: indexPath) as UICollectionViewCell
            
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
        
        if collectionView == self.collectionViewA {
            
            print(indexPath.item)
            
            selectedCell.contentView.backgroundColor = UIColor.white
            
            
            
        } else {
            print(indexPath.item)
            selectedCell.contentView.backgroundColor = UIColor.red
            
        }
    }
    
    
    


}

