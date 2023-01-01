//
//  MemorizeApp.swift
//  Memorize
//
//  Created by iMac on 5/11/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
 
    let persistenceController = PersistenceController.shared

    var body: some Scene {
      
        WindowGroup {
          LoginView()
           // ProfileView(avocat: User(firstname: "", password: "", email: "", lastName: "", specialite: "", image: "", experience: 0, role: ""))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
