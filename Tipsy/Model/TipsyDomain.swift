//
//  TipsyDomain.swift
//  Tipsy
//
//  Created by Rahul Padmakumar on 17/03/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyDomain{
    
    var splitAmount: Float?
    
    mutating func calculateSplit(amount: String?, tip: String?, personCount: String?){
        guard let safeAmount = amount, let safeTip = tip, let safeCount = personCount else {
            return 
        }
        let tempAmount = (safeAmount as NSString).floatValue
        let tempPersonCount = (safeCount as NSString).intValue
        var tipValue: Int = 0
        
        switch(safeTip){
        case "0%": tipValue = 0
        case "10%": tipValue = 10
        default: tipValue = 20
        }
        
        let tipsAmount = tempAmount * ((Float(tipValue))/100.0)
        let totalAmount = tempAmount + tipsAmount
        splitAmount = totalAmount/Float(tempPersonCount)
    }
    
}
