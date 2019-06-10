//
//  PassDeviceViewController.swift
//  TestingBattleShip
//
//  Created by austin on 5/27/19.
//  Copyright © 2019 austin. All rights reserved.
//

import UIKit

class PassDeviceViewController: UIViewController {

    @IBOutlet weak var passDeviceLabel1: UILabel!
    
    @IBOutlet weak var passDeviceLabel2: UILabel!
    
    @IBOutlet weak var passDeviceBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passDeviceBut.layer.cornerRadius = 10
        passDeviceBut.layer.borderWidth = 5
        passDeviceBut.layer.borderColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
    }
    
    @IBAction func passToPlayer2(_ sender: Any) {
        performSegue(withIdentifier: "passDeviceToPlayer2", sender: self)
    }
}


