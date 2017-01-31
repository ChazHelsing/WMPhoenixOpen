//
//  GolfPlayersViewController.swift
//  Test
//
//  Created by Chaz Helsing on 1/24/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation
import UIKit

class GolfPlayersViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, PlayerManagerDelegate {
        
    let playerManager = PlayerManager()
    
    var pImage = String()
    func didLoadPlayers() {
        listTableView.reloadData()
    }

    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        playerManager.delegate = self
        
        playerManager.loadPlayers()
        
        listTableView.backgroundView = UIImageView(image: UIImage(named: "grass background"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerManager.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier : String = "BasicCell"
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        
        pImage = playerManager.players[indexPath.row].playerImage
        let url = URL(string: pImage)
        if pImage == "An Error has occured" {
        } else {
        let data = NSData(contentsOf: url!)
        var image = UIImage()
        image = UIImage(data: data as! Data)!
        
        cell.imageView?.image = image
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        cell.imageView?.layer.cornerRadius = 18
        cell.imageView?.layer.masksToBounds = true
        }
        cell.textLabel!.text = playerManager.players[indexPath.row].fName + " " + playerManager.players[indexPath.row].lName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //
    // Segue
    //
    
    
    // Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.listTableView.indexPathForSelectedRow
        guard let selectedRow = indexPath?.row else { return }
        if pImage == "An Error has occured" {
        } else {
        let selectedName = playerManager.players[selectedRow]
        
        let destinationViewController = segue.destination as! GolfPlayerStatsViewController
        
        destinationViewController.playerStatsText = "\(selectedName.fName) \(selectedName.lName)\nDOB: \(selectedName.dob)\nHeight: \(selectedName.height)\nWeight: \(selectedName.weight) lbs\nState: \(selectedName.state)\nCountry: \(selectedName.country)"
        destinationViewController.playerInfoText = selectedName.info
        destinationViewController.golferImage = selectedName.playerImage
        }
    }
}
