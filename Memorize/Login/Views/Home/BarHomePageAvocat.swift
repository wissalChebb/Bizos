//
//  HomePageAvocat.swift
//  Memorize
//
//  Created by Apple Esprit on 25/11/2022.
//

import SwiftUI

struct BarHomePageAvocat: View {
    var body: some View {
        ZStack{
            TabView {
                HomeAvocatView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
               
           
                ProfileView()
                    .badge(2)
                    .tabItem {
                        Label("Received", systemImage: "tray.and.arrow.down.fill").foregroundColor(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))
                    }
                ChosePackView()
              
                    .tabItem {
                        Label("Sent", systemImage: "folder.badge.person.crop")
                    }
                EditProfileUView()
                   
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
                    }
                
                
                
            }.background(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))
        }.background(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))
    }
}

struct BarHomePageAvocat_Previews: PreviewProvider {
    static var previews: some View {
        BarHomePageAvocat()
    }
}
