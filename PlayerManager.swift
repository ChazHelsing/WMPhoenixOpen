//
//  PlayerManager.swift
//  Test
//
//  Created by Chaz Helsing on 1/25/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol PlayerManagerDelegate {
    func didLoadPlayers()
}

class PlayerManager {
    
    var players = [Players]()
    
    var delegate: PlayerManagerDelegate? = nil
    
    func loadPlayers() {
        let golfPlayers = "http://helsingproductions.com/servicePlayers.php"
        let url = URL(string: golfPlayers)
        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else {
                print("data was nil")
                return
            }
            let json = JSON(data: data)
            let entries = json[].array
            
            if entries != nil {
            
            for entry in entries! {
                
                let fName = entry["fName"].string!
                let lName = entry["lName"].string!
                let dob = entry["dob"].string!
                let height = entry["height"].string!
                let weight = entry["weight"].string!
                let state = entry["state"].string!
                let country = entry["country"].string!
                let info = entry["info"].string!
                let playerImage = entry["playerImage"].string!
 
                let player = Players(fName: fName, lName: lName, dob: dob, height: height, weight: weight, state: state, country: country, info: info, playerImage: playerImage)
            
                self.players.append(player)
            }
            } else {
                let fName = "An Error has occured,"
                let lName = "press back to reload"
                let dob = "An Error has occured"
                let height = "An Error has occured"
                let weight = "An Error has occured"
                let state = "An Error has occured"
                let country = "An Error has occured"
                let info = "An Error has occured"
                let playerImage = "An Error has occured"
                
                let player = Players(fName: fName, lName: lName, dob: dob, height: height, weight: weight, state: state, country: country, info: info, playerImage: playerImage)
                self.players.append(player)
            }
            
                if let delegate = self.delegate {
                    DispatchQueue.main.async {
                        delegate.didLoadPlayers()
                }
            }

        }
        session.resume()
    }
}
