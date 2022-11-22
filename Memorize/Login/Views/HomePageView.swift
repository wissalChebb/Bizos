//
//  ContentView.swift
//  Memorize
//
//  Created by iMac on 5/11/2022.
//

import SwiftUI

struct HomePageView: View {
    @State private var isShowingDetailView = false
    let citeies = ["columbus","cleveland","belaire","athens"]
    var body: some View {
        NavigationView{
            
            
            
            VStack{
                
                // Top View
                Image("headerLogin")
                    .overlay(
                        VStack {
                            NavigationLink(destination:RegisterAvocatView() ){
                                Text("devenir un avocat?")
                                    .font(.callout)
                                    .bold().colorMultiply(.blue)
                            }
                            
                            
                        } .position(x:300,y:80)
                        
                    )
                Spacer()
                // Bottom View
                Image("bottomLogin")
                
            }
            .background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
        }}
    
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

