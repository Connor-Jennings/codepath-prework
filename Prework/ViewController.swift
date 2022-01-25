//
//  ViewController.swift
//  Prework
//
//  Created by Connor Jennings on 1/21/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Retrieve last value
        if UserDefaults.standard.float(forKey: "billAmount") != 0.0{
            billAmountTextField.text = String(UserDefaults.standard.float(forKey: "billAmount"))
        }
        billAmountTextField.becomeFirstResponder()
    }
    
    

    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15,0.18,0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // update total amount label
        totalLabel.text = String(format: "$%.2f", total)
        
        // save value
        UserDefaults.standard.set(Float(billAmountTextField.text!), forKey: "billAmount")
        
    }
    


}

