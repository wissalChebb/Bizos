//
//  HomeAvocatView.swift
//  Memorize
//
//  Created by Apple Esprit on 25/11/2022.
//

import SwiftUI

struct HomeAvocatView: View {
    var body: some View {
        NavigationView{
          
                ZStack{
                    Color("Bg").edgesIgnoringSafeArea(.all)
                    
                    ScrollView() {
                        VStack(alignment:.leading){
                            AppBar()
                            TagLineView().padding()
                            SearchView()
                            
                            HStack {
                                Text("Categories")
                                    .font(.custom("PlayFairDisplay-Bold", size: 20))
                                
                                
                                
                                
                            }.padding(.vertical)
                            ScrollView(.vertical,showsIndicators: false) {
                                VStack(spacing:20.0){
                                    ForEach(0 ..< 4) { item in
                                        CategorieView1(image: Image("c1"), size: 320)
                                    }.padding(.trailing)
                                }
                            }
                           
                          
                            
                            
                        }.padding(.horizontal)
                    }
                    
                }
            
        }
    }
}

struct HomeAvocatView_Previews: PreviewProvider {
    static var previews: some View {
      HomeAvocatView()
    }
}

 struct home: View {
     @State var dark = false
     @State var show = false
    var body: some View {
        ZStack(alignment: .leading){
            
            
            GeometryReader{_ in
                VStack{
                    HStack{
                        
                        
                    }
                    Text("Dark Mode Menu")
                }
           MenuView(dark: self.$dark, show:self.$show ).preferredColorScheme(self.dark ? .dark : .light)
                    
            }
        }
    }
}




struct AppBar1: View {
    var body: some View {
        HStack{
            
            Button(action:{}){
                Image("men").padding().background(Color(.white)).cornerRadius(10.0)
            }
            
            Spacer()
            Button(action:{
                
            }) {
                Image(uiImage: #imageLiteral(resourceName: "Profile") ).resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
            
        }
    }
}

struct TagLineView1: View {
    @State private var isAvocat = false
    var body: some View {
        
        HStack{
            Text("Find Your  ").font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color("Primary"))
            + Text("\nSpecialist ! ").font(.custom("PlayfairDisplay-Bold", size: 30))
                .foregroundColor(Color("Primary"))
            Spacer()
            NavigationLink(destination: RegisterAvocatView(),isActive: $isAvocat){
                Button(action: {
                    isAvocat = true
                    
                }){
                    Text("Devenir un avocat").font(.custom("PlayFairDisplay-Bold", size: 12)).foregroundColor(.gray)
                }  }      }}
}

struct SearchView1: View {
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

struct CategorieView1: View {
    let image : Image
    let size : CGFloat
    var body: some View {
       
            HStack(alignment: .top){
                image.resizable().frame( width: 80, height: 80*(size/210)).cornerRadius(20.0)
                Spacer()
               
                VStack{
                    Text("Nom categorie").font(.title)
                    Text("hjgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhhjgjhgjhgjhgjhgjhgjhgj").font(.title3)
                }
               
                
            }.frame(width: size).padding().background(Color.white).cornerRadius(20.0)
          
            
           
            
           
    }
}
struct MenuView: View {
    @Binding var dark : Bool
    @Binding var show : Bool
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation(.default){
                        self.show.toggle()
                    }
                }){
                    Image(systemName: "chevron.backward").resizable().frame(width: 12,height: 20)
                   
                }
                Spacer()
                Button(action: {}){
                    Image(systemName: "square.and.pencil").font(.title)
                }
                
            }.padding(.top).padding(.bottom,25)
            Image("maitre").resizable().frame(width: 80 , height: 80)
                .clipShape(Circle())
            VStack(spacing:12){
                Text("cathrina")
                Text("developer").font(.caption)
                
            }.padding(.top,25)
            
            HStack(spacing: 22 ){
                Image(systemName: "moon.fill").font(.title)
                Text("dark Mode")
                Spacer()
                Button(action: {
                    self.dark.toggle()
                    
                    let scenes = UIApplication.shared.connectedScenes
                    
                    let windowScene = scenes.first as? UIWindowScene
                    let window = windowScene?.windows.first
                   window!.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
                }){
                    Image("off").resizable().frame(width: 42,height: 30).font(.title).rotationEffect(.init(degrees: self.dark ? 100 : 0))
                }
                
            }
            .padding(.top , 25)
            Group{
                Button(action: {}){
                    HStack(spacing : 22){
                        Image("settings").resizable().frame(width: 40,height: 40).foregroundColor(.yellow)
                        
                        Text("settings")
                        Spacer()
                        
                    }
                }
                Button(action: {}){
                    HStack(spacing : 22){
                        Image("c1").resizable().frame(width: 25,height: 25).foregroundColor(.yellow)
                        
                        Text("chats")
                        
                        Spacer()
                    }
                }.padding(.top,25)
                
                
                Button(action: {}){
                    HStack(spacing : 22){
                        Image("c1").resizable().frame(width: 25,height: 25).foregroundColor(.yellow)
                        
                        Text("chats")
                        
                        Spacer()
                    }
                }.padding(.top,25)
                
                Button(action: {}){
                    HStack(spacing : 22){
                        Image("c1").resizable().frame(width: 25,height: 25).foregroundColor(.yellow)
                        
                        Text("chats")
                        
                        Spacer()
                    }
                }.padding(.top,25)
                
                
              
                
                
                
                
                Button(action: {}){
                    HStack(spacing : 22){
                        Image("c1").resizable().frame(width: 25,height: 25).foregroundColor(.yellow)
                        
                        Text("chats")
                        
                        Spacer()
                    }
                }.padding(.top,25)
                
            }.padding(.top,25)
            
    Spacer()
            
           
           
        }.foregroundColor(.primary )
        .padding(.horizontal,20)
        .frame(width: UIScreen.main.bounds.width/1.5)
        .background( (self.dark ? Color.black: Color.white).edgesIgnoringSafeArea(.all)).overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea(.all))
            
    }
}
