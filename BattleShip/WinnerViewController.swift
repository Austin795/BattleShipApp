//
//  WinnerViewController.swift
//  BattleShip
//
//  Created by austin on 6/8/19.
//  Copyright © 2019 austin. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {

    @IBOutlet weak var winButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        winButton.layer.cornerRadius = 10
        winButton.layer.borderWidth = 5
        winButton.layer.borderColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backtoMenuWinner(_ sender: Any) {
        performSegue(withIdentifier: "backToMenuFromWin", sender: self)
        
    }
    

}
