//
//  TPCMapViewController.swift
//  PhoenixOpen2016
//
//  Created by chaz on 7/19/16.
//  Copyright © 2016 Helsing Productions. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class TPCMapViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource,  WeatherServiceDelegate {
    
    
    //
    // TableView Array
    //
    
    
    // Categories Array
    var categories = [Category]()
    
    
    //
    // Weather Variables
    //
    var weatherDescription = ""
    
    let weatherService = WeatherService(appid: "74f8b2e209945d422d92bb9195138814")
    
    var weather: Weather?
    
    func setWeather(_ weather: Weather) {
        
        self.tempatureLabel.text = ("\(weather.tempF)°F")
        self.windLabel.text = ("Wind \(weather.windSpeed) MPH")
        self.weatherDescription = ("\(weather.description)")
        print("Weather Description: \(weatherDescription)")
        weatherDescriptionIcon()
    }
    
    
    //
    // Weather Condition Image Variables & Switch Statement
    //
    
    
    var sun: UIImage = UIImage(named: "sun")!
    var fewClouds: UIImage = UIImage(named: "cloud-3")!
    var cloudy: UIImage = UIImage(named: "cloudy")!
    var rain: UIImage = UIImage(named: "rain-2")!
    var thunderStorm: UIImage = UIImage(named: "storm")!
    var snow: UIImage = UIImage(named: "snowing")!
    var mist: UIImage = UIImage(named: "waves")!
    
    func weatherDescriptionIcon() {
        switch weatherDescription != ""{
        case weatherDescription == "few clouds": weatherIconImageView.image = fewClouds
        case weatherDescription == "scattered clouds": weatherIconImageView.image = fewClouds
        case weatherDescription == "broken clouds": weatherIconImageView.image = cloudy
        case weatherDescription == "shower rain": weatherIconImageView.image = rain
        case weatherDescription == "rain": weatherIconImageView.image = rain
        case weatherDescription == "thunderstorm": weatherIconImageView.image = thunderStorm
        case weatherDescription == "snow": weatherIconImageView.image = snow
        case weatherDescription == "mist": weatherIconImageView.image = mist
        default: weatherIconImageView.image = sun
        }
    }
    
    // Weather Error Message Alert Controller
    func weatherErrorWithMessage(_ message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }

    
    //
    // Map Variables
    //
    
    
    // Core Location Manager
    var coreLocationManager = CLLocationManager()
    
    // Location Manager
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
    @IBOutlet var mapView: MKMapView!
    
    
    //
    // TableView
    //
    
    
    // Course Map Table View
    @IBOutlet weak var courseMapTableView: UITableView!

    
    //
    // TableView Functions
    //
    
    
    func loadData() -> [Category] {
        
        // Food
        let foodMenu1 = Menu(items: ["Bean & Cheese Burrito", "Carne Asada Burrito", "Chicken Burrito", "Veggie Burrito", "Carne Asada Taco", "Chicken Taco", "Chips & Salsa"], price: [4.00, 6.00, 6.50, 5.00, 4.50, 4.50, 3.00])
        let foodMenu2 = Menu(items: ["Lifebird Burger", "Lifebird Cheeseburger", "Lifebird Braut", "Club Sandwich", "French Fries", "Potato Chips", "Ham & Cheese Sub", "Turkey & Cheese Sub"], price: [4.00, 6.00, 6.50, 5.00, 4.50, 4.50, 3.00, 4.50])
        let foodMenu3 = Menu(items: ["Glazed Donut", "Chocolate Donut", "Apple Fritter", "Cherry Fritter", "Donut Holes", "Egg & Cheese Breakfast Sandwich"], price: [4.00, 6.00, 6.50, 5.00, 4.50, 4.50, 3.00])
        let foodMenu4 = Menu(items: ["Original ZinBurger", "ZinBurger with Cheese", "Vegeterian Zinburger", "Regular Fries", "Seasoned Fries", "Curley Fries"], price: [4.00, 6.00, 6.50, 5.00, 4.50, 4.50, 3.00])
        
        let foodVendor1 = CategoryItem(name: "Garcias", menu: foodMenu1)
        let foodVendor2 = CategoryItem(name: "Lifebird Grill", menu: foodMenu2)
        let foodVendor3 = CategoryItem(name: "Dunkin Donuts", menu: foodMenu3)
        let foodVendor4 = CategoryItem(name: "Zinburger", menu: foodMenu4)
        
        // Drinks
        let drinkmenu1 = Menu(items: ["Cervesa", "Margaritas"], price: [6.50, 8.50])
        let drinkMenu2 = Menu(items: ["Cold Beer", "Warm Beer", "Expensive Beer", "Coctails"], price: [6.50, 8.50, 6.50, 8.50])
        let drinkMenu3 = Menu(items: ["Coffee", "Hot Chocolate"], price: [6.50, 8.50])
        let drinkMenu4 = Menu(items: ["Coke", "Sprite", "Mountain Dew"], price: [6.50, 6.50, 6.50])
        
        let drinkVendor5 = CategoryItem(name: "Garcias Cantina", menu: drinkmenu1)
        let drinkVendor6 = CategoryItem(name: "Lifebird Grill Bar", menu: drinkMenu2)
        let drinkVendor7 = CategoryItem(name: "Dunkin Donuts", menu: drinkMenu3)
        let drinkVendor8 = CategoryItem(name: "Zinburger", menu: drinkMenu4)
        
        // Merchandise
        let merch1 = Menu(items: ["Hats"], price: [25.00])
        let merch2 = Menu(items: ["Shirts", "Golf Balls"], price: [25.00, 35.00])
        let merch3 = Menu(items: ["Putters", "Socks"], price: [125.00, 19.00])
        let merch4 = Menu(items: ["Pins", "Jackets", "Boxers"], price: [25.00, 55.00, 20.00])
        
        let merchVendor1 = CategoryItem(name: "Front Gate Merchandise", menu: merch1)
        let merchVendor2 = CategoryItem(name: "Main Merchandise", menu: merch2)
        let merchVendor3 = CategoryItem(name: "Clubhouse Merchandise", menu: merch3)
        let merchVendor4 = CategoryItem(name: "Hole 16 Merchandise", menu: merch4)
        
        // Information
        let info1 = Menu(items: ["Front Gate", "Clubhouse", "Main Merchandise", "Hole 16"], price: [0.0, 0.0, 0.0, 0.0])
        let info2 = Menu(items: ["Entrance", "Clubhouse"], price: [0.0, 0.0])
        let info3 = Menu(items: ["Entrance", "Clubhouse", "Hole 1", "Hole 2", "Hole 3", "Hole 4", "Hole 5", "Hole 6", "Hole 7", "Hole 8", "Hole 9", "Hole 10", "Hole 11", "Hole 12", "Hole 13", "Hole 14", "Hole 15", "Hole 16", "Hole 17", "Hole 18"], price: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        let info4 = Menu(items: ["Entrance", "Clubhouse"], price: [0.0, 0.0, 0.0])
        let info5 = Menu(items: ["Entrance", "Clubhouse", "Hole 16"], price: [0.0, 0.0, 0.0])
        
        let infoCategory1 = CategoryItem(name: "ATMs", menu: info1)
        let infoCategory2 = CategoryItem(name: "First Aid", menu: info2)
        let infoCategory3 = CategoryItem(name: "Restrooms", menu: info3)
        let infoCategory4 = CategoryItem(name: "Lost & Found", menu: info4)
        let infoCategory5 = CategoryItem(name: "Police", menu: info5)
        
        // Seating Array
        let seating1 = Menu(items: ["Hole 1", "Hole 2", "Hole 3", "Hole 4", "Hole 5", "Hole 6", "Hole 7", "Hole 8", "Hole 9", "Hole 10", "Hole 11", "Hole 12", "Hole 13", "Hole 14", "Hole 15", "Hole 16", "Hole 17", "Hole 18"], price: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        let seating2 = Menu(items: ["Hole 1", "Hole 2", "Hole 3", "Hole 4", "Hole 5", "Hole 6", "Hole 7", "Hole 8", "Hole 9", "Hole 10", "Hole 11", "Hole 12", "Hole 13", "Hole 14", "Hole 15", "Hole 16", "Hole 17", "Hole 18"], price: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        let seating3 = Menu(items: ["Hole 1", "Hole 2", "Hole 3", "Hole 4", "Hole 5", "Hole 6", "Hole 7", "Hole 8", "Hole 9", "Hole 10", "Hole 11", "Hole 12", "Hole 13", "Hole 14", "Hole 15", "Hole 16", "Hole 17", "Hole 18"], price: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        let seating4 = Menu(items: ["Hole 1", "Hole 2", "Hole 3", "Hole 4", "Hole 5", "Hole 6", "Hole 7", "Hole 8", "Hole 9", "Hole 10", "Hole 11", "Hole 12", "Hole 13", "Hole 14", "Hole 15", "Hole 16", "Hole 17", "Hole 18"], price: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        let seating5 = Menu(items: ["Hole 1", "Hole 2", "Hole 3", "Hole 4", "Hole 5", "Hole 6", "Hole 7", "Hole 8", "Hole 9", "Hole 10", "Hole 11", "Hole 12", "Hole 13", "Hole 14", "Hole 15", "Hole 16", "Hole 17", "Hole 18"], price: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        
        let seatingLocation1 = CategoryItem(name: "General Admission", menu: seating1)
        let seatingLocation2 = CategoryItem(name: "Lower Level", menu: seating2)
        let seatingLocation3 = CategoryItem(name: "Mid Level", menu: seating3)
        let seatingLocation4 = CategoryItem(name: "Upper Level", menu: seating4)
        let seatingLocation5 = CategoryItem(name: "VIP", menu: seating5)
        
        // Categories
        let food = Category(name: "Food", categoryItem: [foodVendor1, foodVendor2, foodVendor3, foodVendor4])
        let drinks = Category(name: "Drinks", categoryItem: [drinkVendor5, drinkVendor6, drinkVendor7, drinkVendor8])
        let merchandise = Category(name: "Merchandise", categoryItem: [merchVendor1, merchVendor2, merchVendor3, merchVendor4])
        let information = Category(name: "Information", categoryItem: [infoCategory1, infoCategory2, infoCategory3, infoCategory4, infoCategory5])
        let seating = Category(name: "Seating", categoryItem: [seatingLocation1, seatingLocation2, seatingLocation3, seatingLocation4, seatingLocation5])
        
        return [food, drinks, merchandise, information, seating]
    }
    
    // Cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        let category = categories[indexPath.row]
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = category.name
        return cell
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  categories.count
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

        entranceLocationInfo()
        
        categories = loadData()
        
        
        //
        // Weather Stuff
        //
        
        
        self.weatherService.delegate = self
        
        weatherService.getWeatherForLocation()
        
        
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
    }
    
    
    //
    // MapView Functions
    //
    
    func pitchSet() {
        let userCoordinate = CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude)
        let mapCam = MKMapCamera(lookingAtCenter: userCoordinate, fromDistance: 2200, pitch: 82.0, heading: 100)
        mapView.setCamera(mapCam, animated: false)
    }

    func entranceLocationInfo() {
        
        // Entrance Annotation Location
        let latitude = 33.640584
        let longitude = -111.908750
        
        // Entrance Location on map
        let entranceLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        // Entrance Annotation
        let entranceAnnotation: MKPointAnnotation = MKPointAnnotation()
        
        // Annotation Location
        entranceAnnotation.coordinate = entranceLocation
        
        // Annotation Title
        entranceAnnotation.title = "Waste Management Phoenix Open 2017"
        
        // Add the annotation to the map
        self.mapView.addAnnotation(entranceAnnotation)
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
    // Segue
    //
    
    
    // Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = courseMapTableView.indexPathForSelectedRow
        guard let selectedRow = indexPath?.row else { return }
        
        let selectedCategory = categories[selectedRow]
        
        let destinationViewController = segue.destination as! VendorNamesViewController
        
        destinationViewController.categoryItems = selectedCategory.categoryItem
        destinationViewController.temp = tempatureLabel.text!
        destinationViewController.winds = windLabel.text!
        destinationViewController.weatherIconImage = weatherIconImageView.image!
        

    }

}
