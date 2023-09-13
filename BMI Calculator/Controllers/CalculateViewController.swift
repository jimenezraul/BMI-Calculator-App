//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        let sliderAmount = String(format: "%.2f", sender.value)
        heightLabel.text = "\(sliderAmount)m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let sliderWeightAmount = String(format: "%.0f", sender.value)
        weightLabel.text = "\(sliderWeightAmount)Kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let height = heightSlider.value
       let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
         

        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

