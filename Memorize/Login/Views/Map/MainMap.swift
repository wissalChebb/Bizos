//
//  MainMap.swift
//  Memorize
//
//  Created by Apple Esprit on 10/12/2022.
//

import SwiftUI

struct MainMap: View {
    private var LocationManager = locationManager()
    
    var body: some View {
       Map()
    }
}

struct MainMap_Previews: PreviewProvider {
    static var previews: some View {
        MainMap()
    }
}
