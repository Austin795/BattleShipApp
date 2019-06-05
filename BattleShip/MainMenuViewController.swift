//
//  MainMenuViewController.swift
//  TestingBattleShip
//
//  Created by austin on 5/22/19.
//  Copyright © 2019 austin. All rights reserved.
//

import UIKit
import AVFoundation

class MainMenuViewController: UIViewController {
    
    var AudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var mainMenuTitle: UILabel!
    
    @IBOutlet weak var goToGameButton: UIButton!

    @IBOutlet weak var howToPlayButton: UIButton!
    
    @IBAction func goToGame(_ sender: UIButton) {
        
        BattleShip.battleMapPlayer1 = BattleShip.init(buildMap: true, PlayerNum: 1)
        BattleShip.battleMapPlayer2 = BattleShip.init(buildMap: true, PlayerNum: 2)
        
        
        self.performSegue(withIdentifier: "MainMenuSegue", sender: self)
        
        AudioPlayer.stop()
        
    }
    
    @IBAction func howToPlay(_ sender: Any) {
        self.performSegue(withIdentifier: "howToPlaySegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // DO any additional set up after this super load
        
        goToGameButton.layer.cornerRadius = 10
        goToGameButton.layer.borderWidth = 5
        goToGameButton.layer.borderColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
        
        howToPlayButton.layer.cornerRadius = 10
        howToPlayButton.layer.borderWidth = 5
        howToPlayButton.layer.borderColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
        
        //mainMenuTitle.layer.backgroundColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1).cgColor
        //mainMenuTitle.layer.cornerRadius = 10
        //mainMenuTitle.layer.opacity = 0.8
        
        mainMenuTitle.makeOutLine(oulineColor: UIColor.black, foregroundColor: UIColor.init(red: 0.2, green: 0.5, blue: 0.8, alpha: 1))
        
        //mainMenuTitle.layer.borderWidth = 2
        //mainMenuTitle.layer.borderColor = UIColor.white.cgColor
        
        //var oceanTexture = UIImageView(image: oceanBackgroundImage)
        
        // image.image = UIImage(named: "image")
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
      
    
        
        let AssortedMusic = NSURL(fileURLWithPath: Bundle.main.path(forResource: "SonarSound", ofType: "mp3")!)
        
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusic as URL)
        
        AudioPlayer.prepareToPlay()
        
        AudioPlayer.numberOfLoops = -1
        
        AudioPlayer.play()
    }
}
