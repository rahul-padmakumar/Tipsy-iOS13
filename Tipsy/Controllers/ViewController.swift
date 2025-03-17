//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var stepperLabel: UILabel!
    
    @IBOutlet weak var tip0: UIButton!
    @IBOutlet weak var tip20: UIButton!
    @IBOutlet weak var tip10: UIButton!
    
    var tipsyDomain = TipsyDomain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        print(billTextField.text ?? "")
        tipsyDomain.calculateSplit(
            amount: billTextField.text,
            tip: getSelectedTip(),
            personCount: stepperLabel.text
        )
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults"{
            let controller = segue.destination as? ResultViewController
            controller?.splitAmountValue = String(format: "%.2f", tipsyDomain.splitAmount ?? 0.0)
            controller?.totalPersonValue = stepperLabel.text
            controller?.tipValue = getSelectedTip()
        }
    }
    
    @IBAction func onTipEntered(_ sender: UIButton) {
        sender.isSelected = true
        switch(sender.currentTitle){
            case "0%":
                tip10.isSelected = false
                tip20.isSelected = false
            case "10%":
                tip0.isSelected = false
                tip20.isSelected = false
            default:
                tip0.isSelected = false
                tip10.isSelected = false
        }
    }
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        stepperLabel.text = String(format:"%.0f", sender.value)
    }
    
    func getSelectedTip() -> String?{
        if(tip0.isSelected){
            return tip0.currentTitle
        } else if(tip10.isSelected){
            return tip10.currentTitle
        } else {
            return tip20.currentTitle
        }
    }
}

