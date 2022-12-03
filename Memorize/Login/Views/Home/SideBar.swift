//
//  SideBar.swift
//  Memorize
//
//  Created by Apple Esprit on 3/12/2022.
//

import SwiftUI

struct SideBar: View {
    @Binding var showMenu : Bool
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
                        TabButton(title: "profile", image: "maitre")
                        TabButton(title: "profile", image: "maitre")
                        
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
                        Button("Help Center")  {
                            
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
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

