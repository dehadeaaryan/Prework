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
    
    var custom = 0.30
    
    var billAmount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.becomeFirstResponder()
        
        self.tipCalculator.alpha = 0
        
        UIView.animate(withDuration:1, animations: {
            self.tipCalculator.alpha = 0.5
        })
        
        if defaults.bool(forKey: "tip") {
            tipAmountLabel.text = defaults.string(forKey: "tip")
            totalLabel.text = defaults.string(forKey: "total")
        }
        
        if defaults.bool(forKey: "custom") {
            custom = defaults.double(forKey: "custom")
        }
        
        if defaults.bool(forKey: "billAmount") {
            billAmount = defaults.integer(forKey: "billAmount")
            print(billAmount)
        }
        
    }


    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        billAmount = Int(billAmountTextField.text!) ?? 0
        
        if defaults.bool(forKey: "custom") {
            custom = defaults.double(forKey: "custom")
        }
        else {
            custom = 0.30
        }
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2, custom]
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
        defaults.set(billAmount, forKey: "billAmount")
    }
    
    
    @IBAction func calculateTipOnAmountChange(_ sender: Any) {
        calculateTip(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
        calculateTip(self)
        }
    
}

