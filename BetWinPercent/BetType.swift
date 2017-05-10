//
//  BetType.swift
//  BetWinPercent
//
//  Created by iOS on 10/05/17.
//  Copyright © 2017 iOS. All rights reserved.
//

import Foundation

class BetType {
   
    var name : String!
    var coeff : Double!
    init(name:String, coeff: Double) {
        self.name=name;
        self.coeff=coeff
    }
}
