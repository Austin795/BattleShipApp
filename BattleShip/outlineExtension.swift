//
//  outlineExtension.swift
//  TestingBattleShip
//
//  Created by austin on 5/26/19.
//  Copyright © 2019 austin. All rights reserved.
// 
// Code Pulled From
// https://medium.com/@nimjea/custom-label-effects-in-swift-4-69ec12ba2178
// and
// https://github.com/ANSCoder/CustomLabel/blob/master/CustomLabel/Extension/ExUILabel.swift
/*
 * This code snippet is from a tutorial I found online.  Link above to tutorial and source code.
 * I'm choosing to use this code because I wanted to have an outline on some text on the project
 * UIViewcontrollers so it was readable aganist a blue background.  I searched awhile in menus and online to see if there was an easier way but no luck.
 * This is the only method of making an outline on text in swift I found so I used it.
 * If there is a menu option or easier way to do it just comment it in here.
 * You can use it just by saying labelName.makeOutLine
 *
 *
 */

import UIKit

extension UILabel {
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor) {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : oulineColor,
            NSAttributedString.Key.foregroundColor : foregroundColor,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : self.font
            ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
}


