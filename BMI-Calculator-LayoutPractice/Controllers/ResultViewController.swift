//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Alejandro Alfaro on 8/20/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var calculatedBmi: BMI?

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBOutlet weak var resultBackground: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(calculatedBmi!)

        // Do any additional setup after loading the view.
        resultLabel.text = String(format: "%.1f", calculatedBmi?.value ?? "0.0")
        view.backgroundColor = calculatedBmi?.color
        adviceLabel.text = calculatedBmi?.advice
    }
    

    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
}
