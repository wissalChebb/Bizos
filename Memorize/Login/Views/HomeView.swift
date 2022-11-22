//
//  HomeView.swift
//  Memorize
//
//  Created by Apple Esprit on 21/11/2022.
//

import SwiftUI
struct HomeView: View {

    var body: some View {
        ZStack{
            Color("Bg").edgesIgnoringSafeArea(.all)
            
            ScrollView() {
                VStack(alignment:.leading){
                    AppBar()
                    TagLineView().padding()
                    SearchView()
                    ZStack {
                        Image("card")
                        HStack{Text("Looking for Your specialist lL")
                            Image("maitre")
                        }
                        
                    }
                    HStack {
                        Text("Categories")
                            .font(.custom("PlayFairDisplay-Bold", size: 20))
                        Spacer()
                        Button(action: {}){
                            Text("see All").font(.custom("PlayFairDisplay-Bold", size: 12))
                        }
                        
                        
                       
                    }.padding(.horizontal)
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack{
                            ForEach(0 ..< 4) { item in
                                CategorieView(image: Image("c1"), size: 100)
                            }.padding(.trailing)
                        }
                    }
                    HStack {
                        Text("Availabel Lawyer")
                            .font(.custom("PlayFairDisplay-Bold", size: 20)).padding(.horizontal).padding(.top)
                        Spacer()
                        Button(action: {}){
                            Text("see All").font(.custom("PlayFairDisplay-Bold", size: 12))
                        }
                        
                        
                       
                    }.padding(.horizontal)
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack{
                            ForEach(0 ..< 4) { item in
                                CategorieView(image: Image("c1"), size: 210)
                            }.padding(.trailing)
                        }
                    }
                    
                   
                }.padding(.horizontal)
            }
         
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct AppBar: View {
    var body: some View {
        HStack{
            
            Button(action:{}){
                Image("men").padding().background(Color(.white)).cornerRadius(10.0)
            }
            
            
            
            Spacer()
            Button(action:{}) {
                Image(uiImage: #imageLiteral(resourceName: "Profile") ).resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
            
        }
    }
}

struct TagLineView: View {
    var body: some View {
        HStack{
            Text("Find Your  ").font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color("Primary"))
            + Text("\nSpecialist ! ").font(.custom("PlayfairDisplay-Bold", size: 30))
                .foregroundColor(Color("Primary"))
            Spacer()
            Button(action: {}){
                Text("Devenir un avocat").font(.custom("PlayFairDisplay-Bold", size: 12))
            }        }}
}

struct SearchView: View {
    @State private var searsh : String = ""

    var body: some View {
        HStack {
            HStack {
                Image("Search").padding(.trailing)
                TextField("Searsh Avocat", text: $searsh)
            }.padding()
                .background(Color.white)
                .cornerRadius(10.0)
            
            
        }
    }
}

struct CategorieView: View {
    let image : Image
    let size : CGFloat
    var body: some View {
        VStack {
            image.resizable().frame( width: size , height: 200*(size/210)).cornerRadius(20.0)
            Text("Nom categorie").font(.title)               }.frame(width: size).padding().background(Color.white).cornerRadius(20.0)
    }
}
