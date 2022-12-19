//
//  SideBar.swift
//  Memorize
//
//  Created by Apple Esprit on 3/12/2022.
//

import SwiftUI

struct SideBarClient: View {
    @State var firstName:String = UserViewModel.currentUser?.firstName ?? ""
    let url = path().url
    @ObservedObject var viewModel = UserViewModel()
  
    @State var   lastname:String = UserViewModel.currentUser?.lastName ?? ""
    @State var   email:String = UserViewModel.currentUser?.email ?? ""
    @Binding var showMenu : Bool
    @State var logout : Bool = false
    @State var showingsetting : Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            VStack(alignment: .leading, spacing: 14){
                AsyncImage(url: URL(string: "http://\(url)/img/"+(UserViewModel.currentUser?.image ?? "image1.jpg")),
                    content:{ image in
                                   image
                        .resizable().aspectRatio(contentMode: .fill).frame(width: 65,height: 65).clipShape(Circle())

                               },placeholder: { })
               
                Text(firstName).font(.title2.bold())
                Text(lastname).font(.callout)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    VStack(alignment: .leading, spacing: 45){
                        TabButton(title: "Signature", image: "signature")
                        TabButton(title: "My case", image: "suitcase")
                        
                      
                        
                        
                    }.padding()
                    .padding(.leading)
                    .padding(.top , 45)
                    
                    TabButton(title: "My documents", image: "doc.on.doc")
                        .padding()
                        .padding(.leading)
                    
                   
                        
                          
                    Divider()
                    TabButton(title: "change Password", image: " ")
                        .padding()
                        .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 30) {
                       
                       
              
                       
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)  .padding()
                        .padding(.leading).padding(.bottom)
                    
                }
                
            }
            
            VStack(spacing: 0){
                
                Divider()
                HStack{
                    
                      
                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true),isActive: $logout ){
                    Button{
                        UserViewModel.currentUser = nil
                        logout=true
                    }label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                       
                    }
                }
                    Spacer()
                    Button{
                                           self.showingsetting.toggle()
                                       }label: {
                                           Image(systemName: "gearshape")
                                           
                                       }.sheet(isPresented: $showingsetting)
                                       {
                                           SettingView()
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
            case "My case":
                CaseUserView()
            case "My documents":
                ScannerView()
            case "Signature":
                SigniatureView()
            case "change Password":
                ChangePasswordView1(email: $email)
            default:
                Text("daadadz")
            }
            
        }label:{
            HStack(spacing: 14){
                Image(systemName: image)
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        BaseViewClient() }
}
struct SideBarAvocat: View {
    @State var logout : Bool = false
    @State var firstName:String = UserViewModel.currentUser?.firstName ?? ""
    
    @ObservedObject var viewModel = UserViewModel()
    @State var   email:String = UserViewModel.currentUser?.email ?? ""
    @State var   lastname:String = UserViewModel.currentUser?.lastName ?? ""
    @State var showingsetting : Bool = false
    @Binding var showMenu : Bool
    var user : User
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            VStack(alignment: .leading, spacing: 14){
                AsyncImage(url: URL(string: "http://172.17.1.18:5000/img/"+(UserViewModel.currentUser?.image ?? "image1.jpg")),
                    content:{ image in
                                   image
                        .resizable().aspectRatio(contentMode: .fill).frame(width: 65,height: 65).clipShape(Circle())

                               },placeholder: { })
               
                Text("Maitre").font(.title2.bold())
                Text(lastname+"  "+firstName).font(.callout)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    VStack(alignment: .leading, spacing: 45){
                        TabButton(title: "My Packs", image: "tray.full")
                        TabButton(title: "My Cases", image: "briefcase")
                        
                     
                        TabButton(title: "Agenda", image: "calendar")
                        
                        
                    }.padding()
                    .padding(.leading)
                    .padding(.top , 45)
                    
                    Divider()
                    TabButton(title: "change Password", image: " ")
                        .padding()
                        .padding(.leading)
                   
                    VStack(alignment: .leading, spacing: 30) {
                       
                       
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)  .padding()
                        .padding(.leading).padding(.bottom)
                    
                }
                
            }
            
            VStack(spacing: 0){
                
                Divider()
                HStack{

                    
              
                  Spacer()
                    Button{
                                           self.showingsetting.toggle()
                                       }label: {
                                           Image(systemName: "gearshape")
                                           
                                       }.sheet(isPresented: $showingsetting)
                                       {
                                           SettingView()
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
            case "My Cases":
                CaseView()
            case "My Packs":
                ChosePackView()
       
            case "Agenda":
                agenda()
                
            case "change Password":
                ChangePasswordView(email: $email)
            default:
                Text("daadadz")
            }
            
        }label:{
            HStack(spacing: 14){
                Image(systemName: image)
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

