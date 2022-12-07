//
//  MemorizeApp.swift
//  Memorize
//
//  Created by iMac on 5/11/2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
@main
struct MemorizeApp: App {
    init(){
        FirebaseApp.configure()
    }
    let persistenceController = PersistenceController.shared

    var body: some Scene {
      
        WindowGroup {
            
           DiscussionView()
           // ProfileView(avocat: User(firstname: "", password: "", email: "", lastName: "", specialite: "", image: "", experience: 0, role: ""))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
