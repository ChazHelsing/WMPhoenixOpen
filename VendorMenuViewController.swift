//
//  VendorMenuViewController.swift
//  Test
//
//  Created by Chaz Helsing on 1/9/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation
import UIKit


class VendorMenuViewController: UITableViewController {
    
    
    
    //
    // Array Variables
    //
    
    
    var menuItems = [String]()
    var prices = [NSDecimalNumber]()
    
    let numberFormatter = NumberFormatter()


    
    //
    // TableView Functions
    //
    
    
    // Cell For Row At Index Path
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Menu Item", for: indexPath) as UITableViewCell

        let menuItem = menuItems[indexPath.row]
        let cost = numberFormatter.string(from: prices[indexPath.row])
        let price = cost

        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = menuItem

        cell.detailTextLabel?.textColor = UIColor.white
        if prices[indexPath.row] == 0.00 {
            cell.detailTextLabel?.text = ""
        } else {
        cell.detailTextLabel?.text = "\(price!)"
        }
        
        return cell
    }
    
    // Number Of Rows In Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    
    //
    // View Did Load
    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "en_US")
        tableView.backgroundView = UIImageView(image: UIImage(named: "grass background"))

    }

}
