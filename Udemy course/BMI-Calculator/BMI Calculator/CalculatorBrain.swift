//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Nima Beig Mohammadi on 15.04.25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiString = String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiString
    }
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = .init(value: bmiValue, advice: "Underweight", color: .yellow)
        }
        if bmiValue >= 18.5 && bmiValue <= 24.9 {
            bmi = .init(value: bmiValue, advice: "Normal weight", color: .green)
        }
        if bmiValue > 24.9 {
            bmi = .init(value: bmiValue, advice: "Overweight", color: .red)
        }
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
