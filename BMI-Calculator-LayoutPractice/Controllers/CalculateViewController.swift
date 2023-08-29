//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatedBmi: Float?
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightLabel.text = "1.5m"
        weightLabel.text = "100kg"
    }

    @IBAction func onHeightSliderChange(_ sender: UISlider) {
//        heightLabel.text = "\(String(format: "%.2f", ceilf(sender.value * 100) / 100))m"
        
        calculatorBrain.height = sender.value
        heightLabel.text = "\(String(format: "%.2f", calculatorBrain.height))m"
    }
    
    
    @IBAction func onWeightSliderChange(_ sender: UISlider) {
        
        calculatorBrain.weight = sender.value
        weightLabel.text = "\(Int(ceilf(calculatorBrain.weight)))kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        calculatorBrain.calculateBMI()
//        print(calculatedBmi!)
        //        1.  Approach to link two view controllers
        //        let secondVC = SecondViewController()
        //        secondVC.bmiValue = String(format: "%.1f", calculatedBmi)
        //
        //        self.present(secondVC, animated: true)

        //        2. Approach
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.calculatedBmi = BMI(value: calculatorBrain.getBMIValue(), advice: calculatorBrain.getAdvice(), color: calculatorBrain.getColor())
        }
    }
}

