//
//  File.swift
//  Memorize
//
//  Created by Apple Esprit on 10/12/2022.
//

import Foundation
import MapKit


final class Cordinator: NSObject , MKMapViewDelegate{
    var control : Map
    init(_ control : Map) {
        self.control = control
    }
    
    
}
