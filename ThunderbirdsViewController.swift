//
//  ThunderbirdsViewController.swift
//  PhoenixOpen2016
//
//  Created by chaz on 9/12/16.
//  Copyright © 2016 Helsing Productions. All rights reserved.
//

import UIKit

class ThunderbirdsViewController: UIViewController {
    
    let golfBall = UIImage(named: "tbirdGolfBall1")
    
    let tbirdMedallions = UIImage(named: "TBirdMedallions")
    
    let thunderbirdText = "The Thunderbirds began in 1937, when the Phoenix Chamber of Commerce expanded its role as a convention and tourism bureau. There was a need for a special events committee to venture into new fields. Five young executives were selected to lead the committee. The Phoenix Chamber of Commerce suggested that the committee become an “official” group and expand its membership. Each of the five then selected ten additional members to make up a committee of 55. The Thunderbird name was chosen because the emblem of the Phoenix Chamber of Commerce was, and still is, a Thunderbird derived from American Indian symbols. \n\nOne of the early inductees was Bob Goldwater, an avid golfer. Goldwater thought it would be a great idea to sponsor a golf tournament. That first year, Goldwater sold the tickets, recruited volunteers and set up the golf course at the Phoenix Country Club. The Phoenix Open caught on, and in 79 years, has developed into one of the leading stops on the PGA TOUR. Goldwater was Tournament Chairman from 1934 through 1951 and is affectionately called the “Father of The Phoenix Open.” Active Thunderbird membership is limited to 55 members. Each has demonstrated a sincere interest in sports and a dedication to community affairs. All Thunderbird activities and events are the prime responsibility of these Active Thunderbirds and are under the watchful eye of the Big Chief and Thunderbird Council. When a Thunderbird reaches the age of 45, their status changes from Active to that of Life Member. Although they are relieved of continuous duties, it is not unusual to see a Life Thunderbird lending a helping hand at The Waste Management Phoenix Open or one of the many other Thunderbird-sponsored events. To date, there are over 300 members comprising The Thunderbirds organization."
    
    let charitiesText = "Thunderbirds Charities is a non-profit organization formed in 1986 to distribute monies raised through the Waste Management Phoenix Open golf tournament. The Thunderbirds Charities Board consists of 15 board members from varying professional backgrounds. The mission of Thunderbirds Charities is to assist children and families, help people in need and improve the quality of life in our communities. The organization’s giving is directed toward organizations based or with a significant presence in Arizona."
    
    @IBOutlet weak var thunderbirdImageView: UIImageView!
    
    @IBOutlet weak var tbirdLogo: UIImageView!
    
    @IBOutlet weak var textviewBackground: UITextView!
    
    @IBAction func thunderbirdCharitiesButton(_ sender: Any) {

        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "Charities") as! CharitiesViewController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thunderbirdImageView.image = tbirdMedallions
        thunderbirdImageView.translatesAutoresizingMaskIntoConstraints = false
        thunderbirdImageView.layer.cornerRadius = 15
        thunderbirdImageView.layer.masksToBounds = true
        
        tbirdLogo.image = golfBall
        tbirdLogo.translatesAutoresizingMaskIntoConstraints = false
        tbirdLogo.layer.cornerRadius = 15
        tbirdLogo.layer.masksToBounds = true
        
        textviewBackground.text = thunderbirdText
        textviewBackground.layer.cornerRadius = 15
    }
}
