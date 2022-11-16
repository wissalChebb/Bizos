//
//  ContentView.swift
//  Memorize
//
//  Created by iMac on 5/11/2022.
//

import SwiftUI
import CoreData


struct ContentView: View {
    

    var body: some View {
        ZStack{
            TabView {
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
                    .badge("!")
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle.fill")
                    }
            }.background(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))
        }.background(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     ContentView()
    }
}
