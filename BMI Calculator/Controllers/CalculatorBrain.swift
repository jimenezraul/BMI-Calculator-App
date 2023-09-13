//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Raul Jimenez on 9/12/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit


struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Good weight", color: #colorLiteral(red: 0, green: 0.9664203525, blue: 1, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Overweight", color: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))
        }
        
    }
    
    func getBmiValue() -> String {
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
