//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.


import UIKit

class CalculateViewController: UIViewController {

    var calculatedBrain = CalculatorBrain()
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any dditional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLable.text = "\(String(format:"%.2f", sender.value))m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLable.text = "\(String(format:"%.2f", sender.value))Kg"
    }
    @IBAction func calculatedPressed(_ sender: UIButton) {
        let height =  heightSlider.value
        let weight =  weightSlider.value
        
        calculatedBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinitonViewController = segue.destination as! ResultViewController   // you need to narrow down your vc to ResultVC which is the exact data type
            destinitonViewController.bmiValue = calculatedBrain.getBMIValue()
            destinitonViewController.advice = calculatedBrain.getAdvice()
            destinitonViewController.color = calculatedBrain.getColor()
            
        }
    }
}

