//
//  VendorNamesViewController.swift
//  Test
//
//  Created by Chaz Helsing on 1/9/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import UIKit

class VendorNamesViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource {
    
    
    //
    // Array Variables
    //
    
    
    var categoryItems = [CategoryItem]()
    
    
    //
    // Weather Variables
    //
    
    
    var temp : String = ""
    var winds : String = ""
    var weatherIconImage = UIImage()
    
    
    //
    // Map Variables
    //
    
    
    var coreLocationManager = CLLocationManager()
    
    var locManager : LocationManager!
    
    // MARK Map Area
    let mapLatitude = 33.639852
    let mapLongitude = -111.916094
    
    // MARK Map Pitch Point
    let mapPitchLatitude = 33.648212
    let mapPitchLongitude = -111.960571
    
    
    //
    // UILabels
    //
    
    
    // Temp Label
    @IBOutlet weak var tempatureLabel: UILabel!
    
    // Wind Label
    @IBOutlet weak var windLabel: UILabel!
    
    
    //
    // ImageView
    //
    
    
    // Weather Icon Image View
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    
    //
    // MapView
    //
    
    
    // MapView
    @IBOutlet weak var mapView: MKMapView!
    
    
    //
    // TableView
    //
    
    
    // Course Map Table View
    @IBOutlet weak var courseMapTableView: UITableView!
    
    
    //
    // TableView Functions
    //
    
    
    // Cell For Row At Index Path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Vendor Cell", for: indexPath) as UITableViewCell
        
        let food = categoryItems[indexPath.row]
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = food.name
        return cell
    }
    
    // Number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    //
    // View Did Load
    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pitchSet()
        mapView.mapType = .hybridFlyover
        mapView.isPitchEnabled = true
        
        courseMapTableView.backgroundView = UIImageView(image: UIImage(named: "grass background"))

        
        //
        // Weather Stuff
        //
        
        
        tempatureLabel.text = temp
        windLabel.text = winds
        weatherIconImageView.image = weatherIconImage
        
        
        //
        // MapView Stuff
        //

        
        // Core Location Manager
        coreLocationManager.delegate = self
        
        // Location Manager
        locManager = LocationManager.sharedInstance
        
        // Authorization
        let authorizationCode = CLLocationManager.authorizationStatus()
        
        // Check To See If User Has Authorized The App To Get The User's Location
        if authorizationCode == CLAuthorizationStatus.notDetermined {
            if Bundle.main.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil {
                coreLocationManager.requestAlwaysAuthorization()
            } else {
                print("no description provided")
            }
        } else {
            getLocation()
            print("Getting Location")
        }
        
        self.courseMapTableView.reloadData()
    }
    
    
    //
    // MapView Functions
    //
    

    
    func pitchSet() {
        let userCoordinate = CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude)
        let mapCam = MKMapCamera(lookingAtCenter: userCoordinate, fromDistance: 2200, pitch: 82.0, heading: 100)
        mapView.setCamera(mapCam, animated: false)
    }
    
    // Get Current Location
    func getLocation() {
        locManager.startUpdatingLocationWithCompletionHandler { (latitude, longitude, status, verboseMessage, error) in
            self.displayLocation(location: CLLocation(latitude: latitude, longitude: longitude))
        }
    }
    
    // Display the Current Location
    func displayLocation(location:CLLocation) {
        mapView.showsUserLocation = true
    }
    
    // Location Authorization Status
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.notDetermined || status != CLAuthorizationStatus.denied || status != CLAuthorizationStatus.restricted {
            getLocation()
        }
    }
    
    
//    
//     Segue
//    
    
    
    // Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = courseMapTableView.indexPathForSelectedRow
        guard let selectedRow = indexPath?.row else { return }
        
        let selectedFoodVendor = categoryItems[selectedRow]
        
        let destinationViewController = segue.destination as! VendorMenuViewController
        
        destinationViewController.menuItems = selectedFoodVendor.menu.items
        
        destinationViewController.prices = selectedFoodVendor.menu.price
    }
}
