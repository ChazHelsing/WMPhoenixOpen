//
//  GolfPlayerStatsViewController.swift
//  Test
//
//  Created by Chaz Helsing on 1/25/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation
import UIKit

class GolfPlayerStatsViewController : UIViewController, NSURLConnectionDelegate {
    
    
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var playerStatsTextView: UITextView!
    
    @IBOutlet weak var playerInfoTextView: UITextView!
    
    @IBOutlet weak var adLogoImageView: UIImageView!
    
    //
    // Variables
    //
    
    
    var playerStatsText = String()
    
    var playerInfoText = String()
    
    var golferImage = String()
    
    
    let wMLogo = UIImage(named: "wmpologonoback")
    
    let animationDuration = 1.25

    func animations() {
        
        playerImage.center.x = self.view.frame.width + 30
        UIImageView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
            self.playerImage.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        playerStatsTextView.center.x = self.view.frame.width + 30
        UITextView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
            self.playerStatsTextView.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        playerInfoTextView.center.x = self.view.frame.width + 30
        UITextView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
            self.playerInfoTextView.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        adLogoImageView.center.x = self.view.frame.width + 30
        UIImageView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
            self.adLogoImageView.center.x = self.view.frame.width / 2
        }, completion: nil)
        
    }
    
    
    //
    // View Did Load
    //
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animations()
        
        playerImage.translatesAutoresizingMaskIntoConstraints = false
        playerImage.layer.borderWidth = 0.25
        playerImage.layer.cornerRadius = 60
        playerImage.layer.masksToBounds = true
        
        playerInfoTextView.translatesAutoresizingMaskIntoConstraints = false
        playerInfoTextView.layer.borderWidth = 0.25
        playerInfoTextView.layer.cornerRadius = 5
        playerInfoTextView.layer.masksToBounds = true
        
        playerStatsTextView.translatesAutoresizingMaskIntoConstraints = false
        playerStatsTextView.layer.borderWidth = 0.25
        playerStatsTextView.layer.cornerRadius = 5
        playerStatsTextView.layer.masksToBounds = true
        
        adLogoImageView.image = wMLogo
        adLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        playerStatsTextView.text = playerStatsText
        
        playerInfoTextView.text = playerInfoText
        
        let url = URL(string: golferImage)
        if golferImage == "An Error has occured" {
            // Do nothing
        } else {
        let data = NSData(contentsOf: url!)
        playerImage.image = UIImage(data: data as! Data)
        }
    }
}
