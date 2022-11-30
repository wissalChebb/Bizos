//
//  HomePageAvocat.swift
//  Memorize
//
//  Created by Apple Esprit on 25/11/2022.
//

import SwiftUI

struct BarHomePageAvocat: View {
    @ObservedObject var viewModel = UserViewModel()
    var body: some View {
        ZStack{
            TabView {
                HomeAvocatView(user: UserViewModel.currentUser ?? User(firstname: "", password: "", email: "", lastName: "", specialite: "", image: "", experience: 0, role: ""))
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
               
           
                ProfileView()
                    
                    .tabItem {
                        Label("Messagerie", systemImage: "tray.and.arrow.down.fill").foregroundColor(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))
                    }
                CaseView()
              
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
