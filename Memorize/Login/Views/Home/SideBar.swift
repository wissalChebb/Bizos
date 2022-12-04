//
//  SideBar.swift
//  Memorize
//
//  Created by Apple Esprit on 3/12/2022.
//

import SwiftUI

struct SideBarClient: View {
    @Binding var showMenu : Bool
    @State var logout : Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            VStack(alignment: .leading, spacing: 14){
                Image("maitre").resizable().aspectRatio(contentMode: .fill).frame(width: 65,height: 65).clipShape(Circle())
                Text("iJestine").font(.title2.bold())
                Text("@ijustina").font(.callout)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    VStack(alignment: .leading, spacing: 45){
                        TabButton(title: "Signiature", image: "maitre")
                        TabButton(title: "My case", image: "maitre")
                        
                        TabButton(title: "P", image: "maitre")
                        TabButton(title: "profile", image: "maitre")
                        
                        
                    }.padding()
                    .padding(.leading)
                    .padding(.top , 45)
                    Divider()
                    TabButton(title: "profile", image: "maitre")
                        .padding()
                        .padding(.leading)
                    Divider()
                   
                        TabButton(title: "LOG OUT", image: "maitre")
                            .padding()
                        .padding(.leading)
                    Divider()
                   
                    VStack(alignment: .leading, spacing: 30) {
                        Button("Settings")  {
                            
                        }
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true),isActive: $logout ){
                                Button("logout")  {
                                    UserViewModel.currentUser = nil
                                    logout=true
                                }
                                
                            }
              
                       
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)  .padding()
                        .padding(.leading).padding(.bottom)
                    
                }
                
            }
            
            VStack(spacing: 0){
                
                Divider()
                HStack{

      
                    Button{}label: {
                        Image("maitre").resizable().renderingMode(.template).aspectRatio(contentMode: .fill).frame(width: 22, height: 22)
                       
                    }
                    Spacer()
                    Button{}label: {
                        Image("maitre").resizable().renderingMode(.template).aspectRatio(contentMode: .fill).frame(width: 22, height: 22)
                        
                    }
                }.padding([.horizontal,.top],15)
                    .foregroundColor(.primary)
             }
            
        }.padding(.top)
        .frame(maxWidth: .infinity,alignment: .leading)
        .frame(width: getRect().width - 90)
            .frame(maxHeight: .infinity)
            .background(
                Color.primary.opacity(0.04)
                    .ignoresSafeArea(.container , edges: .vertical)
            ).frame(maxWidth: .infinity,alignment: .leading)
            
    }
    @ViewBuilder
    func TabButton(title : String , image: String)->some View{
        NavigationLink{
            
            switch title
            {
            case "Cases":
                CaseView()
            case "Packs":
                ChosePackView()
       
            default:
                Text("daadadz")
            }
            
        }label:{
            HStack(spacing: 14){
                Image(image).resizable().renderingMode(.template).aspectRatio(contentMode: .fill).frame(width: 22, height: 22)
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        baseView() }
}
struct SideBarAvocat: View {
    @State var logout : Bool = false
    @ObservedObject var viewModel = UserViewModel()
    @Binding var showMenu : Bool
    var user : User
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            VStack(alignment: .leading, spacing: 14){
                Image("maitre").resizable().aspectRatio(contentMode: .fill).frame(width: 65,height: 65).clipShape(Circle())
                Text(user.firstName).font(.title2.bold())
                Text(user.email).font(.callout)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    VStack(alignment: .leading, spacing: 45){
                        TabButton(title: "Packs", image: "maitre")
                        TabButton(title: "Cases", image: "maitre")
                        
                        TabButton(title: "profile", image: "maitre")
                        TabButton(title: "profile", image: "maitre")
                        
                        
                    }.padding()
                    .padding(.leading)
                    .padding(.top , 45)
                    Divider()
                    TabButton(title: "profile", image: "maitre")
                        .padding()
                        .padding(.leading)
                    Divider()
                   
                        TabButton(title: "LOG OUT", image: "maitre")
                            .padding()
                        .padding(.leading)
                    Divider()
                   
                    VStack(alignment: .leading, spacing: 30) {
                        Button("Settings")  {
                            
                        }
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true),isActive: $logout ){
                                Button("logout")  {
                                    UserViewModel.currentUser = nil
                                    logout=true
                                }
                                
                            }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)  .padding()
                        .padding(.leading).padding(.bottom)
                    
                }
                
            }
            
            VStack(spacing: 0){
                
                Divider()
                HStack{

      
                    Button{}label: {
                        Image("maitre").resizable().renderingMode(.template).aspectRatio(contentMode: .fill).frame(width: 22, height: 22)
                       
                    }
                    Spacer()
                    Button{}label: {
                        Image("maitre").resizable().renderingMode(.template).aspectRatio(contentMode: .fill).frame(width: 22, height: 22)
                        
                    }
                }.padding([.horizontal,.top],15)
                    .foregroundColor(.primary)
             }
            
        }.padding(.top)
        .frame(maxWidth: .infinity,alignment: .leading)
        .frame(width: getRect().width - 90)
            .frame(maxHeight: .infinity)
            .background(
                Color.primary.opacity(0.04)
                    .ignoresSafeArea(.container , edges: .vertical)
            ).frame(maxWidth: .infinity,alignment: .leading)
            
    }
    @ViewBuilder
    func TabButton(title : String , image: String)->some View{
        
        NavigationLink{
            
            switch title
            {
            case "Cases":
                CaseView()
            case "Packs":
                ChosePackView()
       
            default:
                Text("daadadz")
            }
            
        }label:{
            HStack(spacing: 14){
                Image(image).resizable().renderingMode(.template).aspectRatio(contentMode: .fill).frame(width: 22, height: 22)
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        
    }
}
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

