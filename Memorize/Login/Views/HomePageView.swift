//
//  ContentView.swift
//  Memorize
//
//  Created by iMac on 5/11/2022.
//

import SwiftUI

struct HomePageView: View {
    @State private var isShowingDetailView = false
    var body: some View {
                
            
            
        VStack{
            
            // Top View
            Image("headerLogin")
                .overlay(
                    VStack {
                        Spacer()
                        Text("Welcome")
                                .font(.callout)
                                .bold()
                                                   }
                )
            Spacer()
            // Bottom View
            Image("bottomLogin")
                
        }
        .background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()

    }
    
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

