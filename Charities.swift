//
//  Charities.swift
//  Test
//
//  Created by Chaz Helsing on 1/17/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation
import UIKit

class CharitiesViewController: UIViewController {
    
    let arnieGoldieHope = UIImage(named: "ArnieGoldieHope")
    
    let golfBall = UIImage(named: "tbirdGolfBall1")
    
    let charitiesText = "Thunderbirds Charities is a non-profit organization formed in 1986 to distribute monies raised through the Waste Management Phoenix Open golf tournament. The Thunderbirds Charities Board consists of 15 board members from varying professional backgrounds. The mission of Thunderbirds Charities is to assist children and families, help people in need and improve the quality of life in our communities. The organization’s giving is directed toward organizations based or with a significant presence in Arizona."
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var thunderbirdImageView: UIImageView!
    
    @IBOutlet weak var charitiesTextView: UITextView!
    
    @IBAction func benefitingCharitiesButton(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "BenefitingCharities") as! ThunderbirdBenefitingCharitiesViewController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        thunderbirdImageView.image = arnieGoldieHope
        thunderbirdImageView.translatesAutoresizingMaskIntoConstraints = false
        thunderbirdImageView.layer.cornerRadius = 15
        thunderbirdImageView.layer.masksToBounds = true
        
        logoImageView.image = golfBall
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layer.cornerRadius = 15
        logoImageView.layer.masksToBounds = true
        
        charitiesTextView.text = charitiesText
        charitiesTextView.layer.cornerRadius = 15
    }
}
