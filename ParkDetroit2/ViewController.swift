//
//  ViewController.swift
//  ParkDetroit2
//
//  Created by ling on 10/27/15.
//  Copyright © 2015 Ling. All rights reserved.
//  Detroit   42.3528795,-83.2392889


import UIKit
import GoogleMaps
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var locationManager: CLLocationManager?
    var currentLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startStandardUpdates()
        var camera = GMSCameraPosition.cameraWithLatitude(currentLocation.coordinate.latitude,
            longitude: currentLocation.coordinate.longitude, zoom: 5)
//        var camera = GMSCameraPosition.cameraWithLatitude(42.335879,
//            longitude: -83.049745, zoom: 8)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        

        var marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2DMake(42.280826,-83.743038)
        marker1.title = "Ann Arbor"
        marker1.snippet = "Michigan"
        marker1.map = mapView
        
        distanceInMetersFrom(CLLocation(latitude: 42.335879, longitude: -83.049745), secondLoc: CLLocation(latitude: 42.280826, longitude: -83.743038))
    }

    
//    
//    //This function gives permission to and starts the map display on your current location
//    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        if status == CLAuthorizationStatus.AuthorizedAlways {
//            viewMap.myLocationEnabled = true
//            locationManager.startUpdatingLocation()
//            viewMap.settings.myLocationButton = true
//        }
//    }
    
    func startStandardUpdates() {
        
        
        
        if locationManager == nil {
            locationManager = CLLocationManager()
        }
        
        locationManager?.requestAlwaysAuthorization()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = 50.0
        
        // Conditional check of locationServicesEnabled method
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.startUpdatingLocation()
            print("location services enabled")
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let eventDate = location?.timestamp
        let howRecent = eventDate?.timeIntervalSinceNow
        
        print(location)
        currentLocation = location!
        print("test location again: \(currentLocation.coordinate.latitude) \n")
        print(eventDate)
        print(howRecent)
//        addMarker(currentLocation.coordinate.latitude, long: currentLocation.coordinate.longitude)
        
        
        
    }
    
    

    func distanceInMetersFrom(firstLoc : CLLocation, secondLoc: CLLocation) -> CLLocationDistance {
        let firstLoc = firstLoc
        let secondLoc = secondLoc
        print(" babababababababababbababababababababababbababababab\(firstLoc.distanceFromLocation(secondLoc))")
        return firstLoc.distanceFromLocation(secondLoc)
    }

    

    
//    func addMarker(lat: Double, long: Double) {
//        var marker = GMSMarker()
//        print("test location for the first time \(currentLocation.coordinate.latitude)")
//        marker.position = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
//        marker.title = "Your Are Here"
//    }
    
    
}
