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
    @Binding  var showMenu :Bool
    var user:User
    @ObservedObject  var categorieViewModel = CategorieViewModel()
    @ObservedObject  var userViewModel = UserViewModel()

   
    var body: some View {
        NavigationView{
            
            
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
                                    AsyncImage(url: URL(string: "http://172.17.1.190:5000/img/"+user.image),
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
                                        NavigationLink(
                                            destination: GetByCategorieView(categorie:categorieViewModel.categories[item].name),
                                          label: {
                                              CategorieView(categorie: categorieViewModel.categories[item],size: 100)
                                              
                                          })
                                        
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
                                      NavigationLink(
                                        destination: ProfileView(avocat: userViewModel.avocats[item]),
                                        label: {
                                            AvocatView(user: userViewModel.avocats[item])
                                            
                                        })
                                    }.padding(.trailing)
                                    
                                }
                            }
                            
                            
                        }.padding(.horizontal)
                    }
                    
                }
            }.navigationBarBackButtonHidden(true).navigationBarTitleDisplayMode(.inline)
            
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
       BaseViewClient()
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
            AsyncImage(url: URL(string: "http://192.168.1.188:5000/img/"+categorie.image),
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
                    Text(user.specialite).font(.custom("PlayfairDisplay-Bold", size: 18))
                        .foregroundColor(Color(.gray)).bold()
                    Text("experience:").font(.custom("PlayfairDisplay-Bold", size: 17))
                        .foregroundColor(Color(.gray)).bold()
                    
                    Text(String(user.experience)+" Years").font(.custom("PlayfairDisplay-Bold", size: 16))
                        .foregroundColor(Color(.gray)).bold().position(x:40)
                    
                }.padding()
                VStack(alignment: .leading){
                  
                    AsyncImage(url: URL(string: "http://192.168.1.188:5000/img/"+user.image),
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

//extension view to get screen RecT


