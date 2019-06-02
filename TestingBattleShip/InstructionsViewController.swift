//
//  InstructionsViewController.swift
//  TestingBattleShip
//
//  Created by austin on 5/31/19.
//  Copyright © 2019 austin. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    @IBOutlet weak var instructionTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        
        
        instructionTitle.makeOutLine(oulineColor: UIColor.black, foregroundColor: UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1))
        //playerNumLabel.makeOutLine(oulineColor: UIColor.black, foregroundColor: UIColor.white)
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        performSegue(withIdentifier: "howToMainMenu", sender: self)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
