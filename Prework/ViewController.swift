//
//  ViewController.swift
//  Prework
//
//  Created by Aaryan Dehade on 8/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipCalculator: UILabel!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 2.0) {
            self.tipCalculator.frame = CGRect(x: self.tipCalculator.center.x, y: self.tipCalculator.center.y, width: 200, height: 200)
            self.tipCalculator.center.x = self.view.center.x
        }
        
        if defaults.bool(forKey: "tip") {
            tipAmountLabel.text = defaults.string(forKey: "tip")
            totalLabel.text = defaults.string(forKey: "total")
        }
        
    }


    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)

        let tipAmountStorage = String(format: "$%.2f", tip)
        let totalAmountStorage = String(format: "$%.2f", total)
        
        // Store value
        defaults.set(tipAmountStorage, forKey: "tip")
        defaults.set(totalAmountStorage, forKey: "total")
    }
    
    
    @IBAction func calculateTipOnAmountChange(_ sender: Any) {
        calculateTip(self)
    }
    
}

