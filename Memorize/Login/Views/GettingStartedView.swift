//
//  ContentView.swift
//  Memorize
//
//  Created by iMac on 5/11/2022.
//

import SwiftUI

struct GettingStartedView: View {
    @State private var isShowingDetailView = false
    var body: some View {
                NavigationView{
            
            
        VStack{
            // Top View
            Image("headerLogin")
                .overlay(
                    VStack {
                        Spacer()
                        Image("gettingStartedLogin")
                            .scaledToFit()
                    }
                )
            Spacer()
            // Bottom View
            Image("bottomLogin")
                .overlay (
                    
                    HStack {
                        
                        Spacer()
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), isActive: $isShowingDetailView){
                            Button("Get Started") {
                                isShowingDetailView = true
                            }
                            .foregroundColor(.black)
                            .frame(width: 100, height: 40)
                            .border(.black,width: 2.0)
                            
                        }
                      
                        
                    }.padding(50)
                )
        }
        .background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()

    }
    
    }
    
}


struct GettingStartView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedView()
    }
}

