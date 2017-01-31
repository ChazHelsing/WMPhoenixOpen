//
//  HomeViewController.swift
//  Test
//
//  Created by chaz on 11/3/16.
//  Copyright © 2016 Helsing Productions. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBAction func playerButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GolfPlayers") as! GolfPlayersViewController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    @IBAction func mapButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Map") as! TPCMapViewController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func chatButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Chat") as! MessagesController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func leaderboardButton(_ sender: Any) {
    }
    
    @IBAction func birdsNestButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Birds Nest") as! BirdsNestViewController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func thunderbirdsButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Thunderbirds") as! ThunderbirdsViewController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBOutlet weak var playersButton: UIButton!
    
    @IBOutlet weak var mapButton: UIButton!
    
    @IBOutlet weak var chatButton: UIButton!
    
    @IBOutlet weak var leaderboardButton: UIButton!
    
    @IBOutlet weak var birdsNestButton: UIButton!
    
    @IBOutlet weak var thunderbirdButton: UIButton!
    
    
    @IBOutlet weak var playersBackground: UIImageView!
    
    @IBOutlet weak var mapBackground: UIImageView!
    
    @IBOutlet weak var chatBackground: UIImageView!
    
    @IBOutlet weak var leaderboardBackground: UIImageView!
    
    @IBOutlet weak var birdsNestBackground: UIImageView!
    
    @IBOutlet weak var thunderbirdBackground: UIImageView!
    
    let animationDuration = 1.25
    
    func loadButtonAnimations () {
        
    let playerMaskPath = UIBezierPath(roundedRect: playersBackground.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 18.0, height: 0.0))
    let playerMaskLayer = CAShapeLayer()
    playerMaskLayer.path = playerMaskPath.cgPath
    playersBackground.layer.mask = playerMaskLayer
    view.addSubview(playersBackground)
    view.addSubview(playersButton)
    playersBackground.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.playersBackground.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    playersButton.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.playersButton.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    let mapMaskPath = UIBezierPath(roundedRect: mapBackground.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 18.0, height: 0.0))
    let mapMaskLayer = CAShapeLayer()
    mapMaskLayer.path = mapMaskPath.cgPath
    mapBackground.layer.mask = mapMaskLayer
    view.addSubview(mapBackground)
    view.addSubview(mapButton)
    mapBackground.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 0.25, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.mapBackground.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    mapButton.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 0.25, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.mapButton.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    let chatMaskPath = UIBezierPath(roundedRect: chatBackground.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 18.0, height: 0.0))
    let chatMaskLayer = CAShapeLayer()
    chatMaskLayer.path = chatMaskPath.cgPath
    chatBackground.layer.mask = chatMaskLayer
    view.addSubview(chatBackground)
    view.addSubview(chatButton)
    chatBackground.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.chatBackground.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    chatButton.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.chatButton.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    let leaderboardMaskPath = UIBezierPath(roundedRect: leaderboardBackground.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 18.0, height: 0.0))
    let leaderboardMaskLayer = CAShapeLayer()
    leaderboardMaskLayer.path = leaderboardMaskPath.cgPath
    leaderboardBackground.layer.mask = leaderboardMaskLayer
    view.addSubview(leaderboardBackground)
    view.addSubview(leaderboardButton)
    leaderboardBackground.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 0.75, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.leaderboardBackground.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    leaderboardButton.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 0.75, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.leaderboardButton.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    let birdsNestMaskPath = UIBezierPath(roundedRect: birdsNestBackground.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 18.0, height: 0.0))
    let birdsNestMaskLayer = CAShapeLayer()
    birdsNestMaskLayer.path = birdsNestMaskPath.cgPath
    birdsNestBackground.layer.mask = birdsNestMaskLayer
    view.addSubview(birdsNestBackground)
    view.addSubview(birdsNestButton)
    birdsNestBackground.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 1, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.birdsNestBackground.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    birdsNestButton.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 1, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.birdsNestButton.center.x = self.view.frame.width / 2
    }, completion: nil)
    
    let thunderbirdMaskPath = UIBezierPath(roundedRect: thunderbirdBackground.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 18.0, height: 0.0))
    let thunderbirdMaskLayer = CAShapeLayer()
    thunderbirdMaskLayer.path = thunderbirdMaskPath.cgPath
    thunderbirdBackground.layer.mask = thunderbirdMaskLayer
    view.addSubview(thunderbirdBackground)
    view.addSubview(thunderbirdButton)
    thunderbirdBackground.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 1.25, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.thunderbirdBackground.center.x = self.view.frame.width / 2
    }, completion: nil)
        
    thunderbirdButton.center.x = self.view.frame.width + 30
    UIView.animate(withDuration: animationDuration, delay: 1.25, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, animations: {
    self.thunderbirdButton.center.x = self.view.frame.width / 2
    }, completion: nil)
}

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadButtonAnimations()
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
