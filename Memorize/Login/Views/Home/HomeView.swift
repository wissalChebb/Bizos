//
//  HomeView.swift
//  Memorize
//
//  Created by Apple Esprit on 21/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import Alamofire
import SwiftyJSON
struct HomeView: View {
    var user:User
    @ObservedObject  var categorieViewModel = CategorieViewModel()
    @ObservedObject  var userViewModel = UserViewModel()
    @State var dark = false
    @State var show = false
    @State var showSidebar = false
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
                                            .frame( width:50, height: 50).cornerRadius(20.0)
                                    },placeholder: { })
                                }
                                
                            }
                            TagLineView1().padding()
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
                                    Text("see All").font(.custom("PlayFairDisplay-Bold", size: 12)).foregroundColor(.gray)
                                }
                                
                                
                                
                            }.padding(.horizontal)
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack{
                                    
                                    
                                    ForEach(0..<categorieViewModel.categories.count,id: \.self ) { item in
                                        CategorieView(categorie: categorieViewModel.categories[item],size: 100)
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
                                    ForEach(0..<userViewModel.avocats.count,id: \.self ) { item in
                                        AvocatView(user: userViewModel.avocats[item])
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
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(firstname: "", lastName: "", specialite: "", image: "", experience: 0))
    }
}


struct AppBar: View {
    @State var dark = false
    @State var show = false
    var body: some View {
        HStack{
            
            Button(action:{
                MenuView(dark: self.$dark, show:self.$show ).preferredColorScheme(self.dark ? .dark : .light)
            }){
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
    @State private var isAvocat = false
    var body: some View {
        
        HStack{
            Text("Find Your  ").font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color("Primary"))
            + Text("\nArticle! ").font(.custom("PlayfairDisplay-Bold", size: 30))
                .foregroundColor(Color("Primary"))
            
                }}
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
    var image : Image? = Image("")
    var categorie :Categorie
    var size : CGFloat
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: "http://172.17.11.147:5000/img/"+categorie.image),
                                      content:{ image in
                               image.resizable()
                    .aspectRatio( contentMode: .fill)
                    .clipped()
                    .clipShape(Rectangle())
                    .frame( width: 50 , height: 200*(50/210)).cornerRadius(20.0)
                           },placeholder: { })
/*
            image
                .resizable().frame( width: size , height: 200*(size/210)).cornerRadius(20.0)*/
            Text(categorie.name).font(.title3)  }.frame(width: 100, height: 170).padding().background(Color.white).cornerRadius(20.0)
    }
}

struct AvocatView:View{
    var user:User
    var body: some View {
        ZStack{
            Image("pac").frame(width: 340,height: 190).cornerRadius(30)
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Text(user.firstName).font(.custom("PlayfairDisplay-Regular", size: 25))
                            .foregroundColor(Color("Primary"))
                        + Text(" "+user.lastName).font(.custom("PlayfairDisplay-Bold", size: 25))
                            .foregroundColor(Color("Primary"))
                        
                            }
                    Text(user.specialite)
                    Text("Experioence:")
                    
                    Text(String(user.experience)+" Years")
                    
                }.padding()
                VStack(alignment: .leading){
                  
                    AsyncImage(url: URL(string: "http://172.17.11.147:5000/img/"+user.image),
                                              content:{ image in
                                       image  .resizable()
                            .aspectRatio( contentMode: .fill)
                            .clipped()
                            .clipShape(Rectangle())
                            .frame( width: 100 , height: 300*(100/210)).cornerRadius(20.0)
                                   },placeholder: { })                }.padding()
                
            }.frame(width: 350,height: 200).cornerRadius(40)
        }
}
}

