//
//  Map.swift
//  Memorize
//
//  Created by Apple Esprit on 10/12/2022.
//

import SwiftUI
import MapKit

struct Map: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView{
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    func makeCoordinator() -> Cordinator {
        Cordinator(self)
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<Map>) {
        
    }

}



