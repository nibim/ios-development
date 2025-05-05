//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let arrayOfIndicies = [UIImage(named: "DiceOne"),UIImage(named: "DiceTwo"),UIImage(named: "DiceThree"),UIImage(named: "DiceFour"),UIImage(named: "DiceFive"),UIImage(named: "DiceSix")]
    
    

    @IBAction func rollButtonPressed(_ sender: Any) {
        let firstRandomNumber = Int.random(in: 0..<6);
        let secondRandomNumber = Int.random(in: 0..<6)
        diceImageView1.image = arrayOfIndicies [firstRandomNumber]
        diceImageView2.image = arrayOfIndicies [secondRandomNumber]
    }
    
}

