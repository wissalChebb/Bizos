//
//  HomeAvocatView.swift
//  Memorize
//
//  Created by Apple Esprit on 25/11/2022.
//

import SwiftUI

struct HomeAvocatView: View {
    @ObservedObject  var newsViewModel = NewsViewModel()

    @Binding var showMenu: Bool
    var user:User
    var body: some View {
        
          
                ZStack{
                    GeometryReader{_ in
                        
                        Color("Bg").edgesIgnoringSafeArea(.all)
                        ScrollView() {
                            VStack(alignment:.leading){
                                HStack{
                                    Button{
                                        withAnimation{showMenu.toggle()}
                                    }label: {
                                        Image("men").padding().background(Color(.white)).cornerRadius(10.0)
                                    }
                                   
                                    
                                    Spacer()
                                    
                                    Button(action:{
                                        
                                    }) {
                                        AsyncImage(url: URL(string: "http://172.17.2.217:5000/img/"+user.image),
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
                       
                       
                    }
                    
                }

            
        
    }
}

struct HomeAvocatView_Previews: PreviewProvider {
    static var previews: some View {
     baseView()
    }
}

 /*struct home: View {
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

*/



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

