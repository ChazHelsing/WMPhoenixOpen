//
//  Players.swift
//  Test
//
//  Created by Chaz Helsing on 1/25/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation

class Players {
    
    let fName : String
    let lName : String
    let dob : String
    let height : String
    let weight : String
    let state : String
    let country : String
    let info : String
    let playerImage : String
    
    init(fName: String, lName: String, dob: String, height: String, weight: String, state: String, country: String, info: String, playerImage: String) {
        
        self.fName = fName
        self.lName = lName
        self.dob = dob
        self.height = height
        self.weight = weight
        self.state = state
        self.country = country
        self.info = info
        self.playerImage = playerImage
    }
}
