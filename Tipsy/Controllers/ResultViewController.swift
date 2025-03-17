//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Rahul Padmakumar on 17/03/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalPerson: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    
    var splitAmountValue: String?
    var totalPersonValue: String?
    var tipValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        splitAmount.text = splitAmountValue
        totalPerson.text = "Split between \(totalPersonValue ?? "0") people with \(tipValue ?? "0") tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
