//
//  Home.swift
//  Uber Clone
//
//  Created by Balaji on 29/04/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct Home : View {
    
    @State var map = MKMapView()
    @State var manager = CLLocationManager()
    @State var alert = false
    @State var source : CLLocationCoordinate2D!
    @State var destination : CLLocationCoordinate2D!
    @State var name = ""
    @State var distance = ""
    @State var longitud = ""
    @State var latitud = ""
    @State var time = ""
    @State var show = false
    @State var loading = false
    @State var book = false
    @State var doc = ""
    @State var data : Data = .init(count: 0)
    @State var search = false
    
    @State var next = false
    var body: some View{
        NavigationView{
            ZStack{
                
                ZStack(alignment: .bottom){
                    
                    VStack(spacing: 0){
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text(self.destination != nil ? "Destination" : "Pick a Location")
                                    .font(.title)
                                
                                if self.destination != nil{
                                    
                                    Text(self.name)
                                        .fontWeight(.bold)
                                }
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                                self.search.toggle()
                                
                            }) {
                                
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        
                        MapView(map: self.$map, manager: self.$manager, alert: self.$alert, source: self.$source, destination: self.$destination, name: self.$name,distance: self.$distance,time: self.$time, show: self.$show)
                            .onAppear {
                                
                                self.manager.requestAlwaysAuthorization()
                                
                            }
                    }
                    
                    if self.destination != nil && self.show{
                        
                        ZStack(alignment: .topTrailing){
                            
                            VStack(spacing: 20){
                                
                                HStack{
                                    
                                    VStack(alignment: .leading,spacing: 15){
                                        
                                        Text("Destination")
                                            .fontWeight(.bold)
                                        Text(self.name)
                                        
                                        Text("Distance - "+self.distance+" KM")
                                        
                                        Text("Expexted Time - "+self.time + "Min")
                                    }
                                    
                                
                                }
                                NavigationLink(destination:  RegisterAvocatView(Location:$name).navigationBarBackButtonHidden(true), isActive: $next)
                                {
                                    Button(action: {
                                        
                                        next = true
                                        
                                        
                                    }) {
                                        
                                        Text("Chose ur Location")
                                            .foregroundColor(.white)
                                            .padding(.vertical, 10)
                                            .frame(width: UIScreen.main.bounds.width / 2)
                                    }
                                    .background(Color.red)
                                    .clipShape(Capsule())
                                }
                            }
                            
                            Button(action: {
                                
                                self.map.removeOverlays(self.map.overlays)
                                self.map.removeAnnotations(self.map.annotations)
                                self.destination = nil
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                        .background(Color.white)
                        .position(x:200,y:300)
                    }
                }
                
                if self.loading{
                    
                    Loader()
                }
                
                if self.book{
                    
                    Booked(data: self.$data, doc: self.$doc, loading: self.$loading, book: self.$book)
                }
                
                if self.search{
                    
                    Search(show: self.$search, map: self.$map, source: self.$source, destination: self.$destination, name: self.$name, distance: self.$distance, time: self.$time,detail: self.$show)
                }  
            }
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: self.$alert) { () -> Alert in
                
                Alert(title: Text("Error"), message: Text("Please Enable Location In Settings !!!"), dismissButton: .destructive(Text("Ok")))
            }
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
