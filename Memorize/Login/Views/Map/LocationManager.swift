//
//  LocationManager.swift
//  Memorize
//
//  Created by Apple Esprit on 10/12/2022.
//

import Foundation
import MapKit
class locationManager: NSObject{
    private let locationManager = CLLocationManager()
    
    var location : CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension locationManager: CLLocationManagerDelegate{
    
    
    
    
}
