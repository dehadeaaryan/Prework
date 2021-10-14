//
//  SettingsViewController.swift
//  Prework
//
//  Created by Aaryan Dehade on 10/13/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    let defaults = UserDefaults.standard
    let custom = UserDefaults.standard.double(forKey: "custom")
    
    @IBAction func confirm(_ sender: Any) {
        tipPercentageOnChange(self)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func tipPercentageOnChange(_ sender: Any) {
        let tipPercentageLabelText = Int(tipPercentageSlider.value)
        let tipPercentage = Double(Int(tipPercentageSlider.value)) / Double(100)
        
        tipPercentageLabel.text = String("\(tipPercentageLabelText)%")
        defaults.set(tipPercentage, forKey: "custom")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        confirmButton.layer.cornerRadius = 10
        tipPercentageLabel.text = String("\(Int(custom * 100))%")
        tipPercentageSlider.setValue(Float(custom * 100), animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
