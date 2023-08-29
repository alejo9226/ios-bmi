//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Alejandro Alfaro on 8/20/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var weight: Float = 100
    var height: Float = 1.5
    
    var calculatedBmi: BMI?

    mutating func calculateBMI () {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            calculatedBmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor(red: 35/255, green: 196/255, blue: 237/255, alpha: 1))
            print("underweight")
        } else if bmiValue < 24.9 {
            calculatedBmi = BMI(value: bmiValue, advice: "You're good!", color: UIColor(red: 35/255, green: 204/255, blue: 119/255, alpha: 1))
        } else {
            calculatedBmi = BMI(value: bmiValue, advice: "You should go do some cardio!", color: UIColor(red: 224/255, green: 59/255, blue: 139/255, alpha: 1))
        }
        
        
    }
    
    mutating func setWeight(newWeight: Float) {
        self.weight = newWeight
    }
    
    mutating func setHeight(newHeight: Float) {
        self.height = newHeight
    }
    
//    func getBMIValue () -> Float {
//        return self.calculatedBmi ?? 0.0
//    }
    
    func getBMIValue () -> Float {
        if let safeBmi = calculatedBmi?.value {
            return safeBmi
        } else {
            return 0.0
        }
    }
    
    func getAdvice () -> String {
        return self.calculatedBmi?.advice ?? ""
    }
    
    func getColor () -> UIColor {
        return self.calculatedBmi?.color ?? .green
    }
}
