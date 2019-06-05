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

        // Do any additional setup after loading the view.
        
        // passDeviceLabel1.makeOutLine(oulineColor: UIColor.black, foregroundColor: UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1))
       // passDeviceLabel2.makeOutLine(oulineColor: UIColor.black, foregroundColor: UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1))
        
        passDeviceBut.layer.cornerRadius = 10
        passDeviceBut.layer.borderWidth = 5
        passDeviceBut.layer.borderColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
        
        
        
    }
    
    @IBAction func passToPlayer2(_ sender: Any) {
        performSegue(withIdentifier: "passDeviceToPlayer2", sender: self)
    }
    
    
    
    /* @IBAction func passDeviceToPlayerX(_ sender: UIButton) {
        
        performSegue(withIdentifier: "passDeviceToPlayer2", sender: self)
        */
        /*
        if ShouldShowA {
            performSegue(withIdentifier: "passDeviceToPlayer1", sender: self)
        } else {
            performSegue(withIdentifier: "passDeviceToPlayer2", sender: self)
        }*/
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


