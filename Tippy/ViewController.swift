//
//  ViewController.swift
//  Tippy
//
//  Created by PJ Martinez on 1/4/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billText: UILabel!
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipText: UILabel!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalText: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Keyboard input on bill field opens first within app
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        billText.center.x -= view.bounds.width
        tipText.center.x -= view.bounds.width
        tipLabel.center.x -= view.bounds.width
        totalText.center.x -= view.bounds.width
        totalLabel.center.x -= view.bounds.width
        tipControl.center.x -= view.bounds.width
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0, animations: {
            self.billText.center.x += self.view.bounds.width
            self.tipText.center.x += self.view.bounds.width
            self.tipLabel.center.x += self.view.bounds.width
            self.totalText.center.x += self.view.bounds.width
            self.totalLabel.center.x += self.view.bounds.width
            self.tipControl.center.x += self.view.bounds.width
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
    }
    
}

