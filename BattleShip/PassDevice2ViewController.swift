//
//  PassDevice2ViewController.swift
//  TestingBattleShip
//
//  Created by austin on 5/28/19.
//  Copyright © 2019 austin. All rights reserved.
//

import UIKit

class PassDevice2ViewController: UIViewController {

    @IBOutlet weak var passDevice2But: UIButton!
    
    @IBOutlet weak var passDeviceLabel2: UILabel!
    
    @IBOutlet weak var passDeviceLabel2a: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passDevice2But.layer.cornerRadius = 10
        passDevice2But.layer.borderWidth = 5
        passDevice2But.layer.borderColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
    }
    
    @IBAction func passDevice2(_ sender: Any) {
        performSegue(withIdentifier: "passDeviceToPlayer1", sender: self)
    }
}
