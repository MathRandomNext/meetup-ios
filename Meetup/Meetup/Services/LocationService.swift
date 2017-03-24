//
//  LocationService.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/24/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation
import MapKit

public class LocationService: NSObject, LocationServiceProtocol, CLLocationManagerDelegate {
    
    private var locationManager: CLLocationManager!
    private var locationFactory: LocationFactoryProtocol!
    private var currentLocationCoordinate: CLLocationCoordinate2D?
    
    init(locationFactory: LocationFactoryProtocol) {
        super.init()
        self.locationManager = CLLocationManager()
        self.locationFactory = locationFactory
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = CLLocationDistance(Constants.LocationOptions.Radius)
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    convenience override init() {
        self.init(locationFactory: LocationFactory())
    }
    
    public func getCurrentLocation() -> LocationProtocol? {
        guard currentLocationCoordinate != nil else {
            return nil
        }
        
        let latitude = currentLocationCoordinate!.latitude
        let longitude = currentLocationCoordinate!.longitude
        
        var currentLocation = locationFactory.createLocation(latitude: latitude, longitude: longitude)
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            let placeArray = placemarks as [CLPlacemark]!
            
            var placeMark: CLPlacemark!
            placeMark = placeArray?[0]
            
            let addressDictionary = placeMark.addressDictionary
            
            if let locationName = addressDictionary?["Name"] as? NSString {
                currentLocation.name = locationName as String
            }
            
            if let locationCity = addressDictionary?["City"] as? NSString {
                currentLocation.city = locationCity as String
            }
            
            if let locationState = addressDictionary?["State"] as? NSString {
                currentLocation.state = locationState as String
            }
            
            if let locationThoroughfare = addressDictionary?["Thoroughfare"] as? NSString {
                currentLocation.thoroughfare = locationThoroughfare as String
            }
        }
        
        return currentLocation
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        self.currentLocationCoordinate = locationManager.location?.coordinate
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        self.currentLocationCoordinate = newLocation.coordinate
        print(newLocation)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
