//
//  HomeAvocatView.swift
//  Memorize
//
//  Created by Apple Esprit on 25/11/2022.
//

import SwiftUI

struct HomeAvocatView: View {
    @ObservedObject  var newsViewModel = NewsViewModel()
    @State var dark = false
    @State var show = false
    @State var showSidebar = false
    var user:User
    var body: some View {
        
          
                ZStack{
                    GeometryReader{_ in
                        
                        Color("Bg").edgesIgnoringSafeArea(.all)
                        ScrollView() {
                            VStack(alignment:.leading){
                                HStack{
                                    
                                    Button(action:{
                                        self.showSidebar.toggle()
                                    }){
                                        Image("men").padding().background(Color(.white)).cornerRadius(10.0)
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action:{
                                        
                                    }) {
                                        AsyncImage(url: URL(string: "http://172.17.11.147:5000/img/"+user.image),
                                                                  content:{ image in
                                                           image  .resizable()
                                                .aspectRatio( contentMode: .fill)
                                                .clipped()
                                                .clipShape(Rectangle())
                                                .frame( width:80, height: 80).cornerRadius(20.0)
                                                       },placeholder: { })
                                    }
                                    
                                }
                                TagLineView().padding()
                                HStack {
                                    HStack {
                                     
                                        Button(action: {
                                            newsViewModel.getNewsRecherche(search: newsViewModel.search, complited: {(success , respnse)in
                                                if success{
                                                    let news = respnse!
                                                    newsViewModel.news = news
                                                }else {
                                                    print("error cant connect ")
                                                }
                                                
                                            })
                                        }){
                                            Image("Search").padding(.trailing)
                                        }
                                        TextField("Searsh Avocat", text: $newsViewModel.search)
                                    }.padding()
                                        .background(Color.white)
                                        .cornerRadius(10.0)
                                    
                                    
                                }
                                HStack {
                                    Text("News")
                                        .font(.custom("PlayFairDisplay-Bold", size: 20))
                                    
                                }.padding(.vertical)
                                ScrollView(.vertical,showsIndicators: false) {
                                    VStack(spacing:20.0){
                                        ForEach(0..<newsViewModel.news.count , id: \.self ) { item in
                                            CategorieView1(news: newsViewModel.news[item])
                                        }.padding(.trailing)
                                    }
                                }
                                
                                
                                
                                
                            }.padding(.horizontal)
                        }
                        if(showSidebar){
                            MenuView(dark: self.$dark, show:self.$show ).preferredColorScheme(self.dark ? .dark : .light)
                        }
                       
                    }
                    
                }

            
        
    }
}

struct HomeAvocatView_Previews: PreviewProvider {
    static var previews: some View {
      HomeAvocatView(user: User(firstname: "", lastName: "", specialite: "", image: "", experience: 0))
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
                MenuView(dark: self.$dark, show:self.$show ).preferredColorScheme(self.dark ? .dark : .light).offset(x: self.show ? 0 : -UIScreen.main.bounds.width/1.5 )
                    
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


struct CategorieView1: View {
    var news : News
    
  
    var body: some View {
       
            HStack(alignment: .top){
                AsyncImage(url: URL(string: news.thumbnail),
                                          content:{ image in
                                   image  .resizable()
                        .aspectRatio( contentMode: .fill)
                        .clipped()
                        .clipShape(Rectangle())
                        .frame( width:100, height: 100).cornerRadius(20.0)
                               },placeholder: { })
                
               
                VStack{
                    
                    Text(news.title).font(.title3).frame( alignment: .leading)
                 
                }
               
                
            }.frame(width:300,height: 150).padding().background(Color.white).cornerRadius(20.0)
          
            
           
            
           
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
                        
                        Text("Packs")
                        
                        Spacer()
                    }
                }.padding(.top,25)
                
                
                Button(action: {}){
                    HStack(spacing : 22){
                        Image("c1").resizable().frame(width: 25,height: 25).foregroundColor(.yellow)
                        
                        Text("cases")
                        
                        Spacer()
                    }
                }.padding(.top,25)
                
                Button(action: {}){
                    HStack(spacing : 22){
                        Image("c1").resizable().frame(width: 25,height: 25).foregroundColor(.yellow)
                        
                        Text("logout")
                        
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
