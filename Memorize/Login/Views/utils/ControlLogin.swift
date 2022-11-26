//
//  HomeAvocatView.swift
//  Memorize
//
//  Created by Apple Esprit on 22/11/2022.
//

import SwiftUI


struct ControlLogin: View {
   
    @ObservedObject var viewModel = UserViewModel()

   
    var body: some View {
       
        if UserViewModel.currentUser?.role == "User" {
            ContentView()
        } else if UserViewModel.currentUser?.role == "Avocat" {
            BarHomePageAvocat()
        }
         
            
    }
   

}


