//
//  file10.swift
//  Memorize
//
//  Created by Apple Esprit on 3/12/2022.
//

import SwiftUI

struct baseView: View {
    @State var showMenu = false
    @State var offset : CGFloat = 0
    @State var lastStoredoffset : CGFloat = 0
    @GestureState var gestureOffset : CGFloat = 0
    init(){
        UITabBar.appearance().isHidden = false
    }
    var body: some View {
        let sideBarWidth = getRect().width - 90
        NavigationView{
            HStack(spacing: 0){
                SideBarAvocat(showMenu: $showMenu, user: User(firstname: "", password: "", email: "", lastName: "", specialite: "", image: "", experience: 0, role: ""))
                VStack{
                    TabView {
                        
                        HomeAvocatView(showMenu: $showMenu,user: UserViewModel.currentUser ?? User(firstname: "", password: "", email: "", lastName: "", specialite: "", image: "", experience: 0, role: ""))
                            .tabItem {
                                Label("Home", systemImage: "house")
                            }
                       
                   
                        ProfileView()
                            
                            .tabItem {
                                Label("Messagerie", systemImage: "message").foregroundColor(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))
                            }
                        CaseView()
                      
                            .tabItem {
                                Label("Sent", systemImage: "bell.badge.fill")
                            }
                        EditProfileUView()
                           
                            .tabItem {
                                Label("Profile", systemImage: "person.crop.circle.fill")
                            }
                        
                        
                        
                    }.frame(width: getRect().width)
                        .overlay(
                        Rectangle()
                            .fill(Color.primary.opacity(Double((offset/sideBarWidth)/5))
                                 
                                 
                                 ).ignoresSafeArea(.container,edges: .vertical).onTapGesture {
                                     withAnimation{
                                         showMenu.toggle()
                                        
                                     }
                                     
                                 }
                        )
                    .background(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))
                    
                    
                    
                }.frame(width: getRect().width)
            }
            .frame(width: getRect().width+sideBarWidth)
                .offset(x:-sideBarWidth/2)
                .offset(x:offset > 0 ? offset : 0)
                .gesture(DragGesture().updating($gestureOffset, body: {value , out , _ in
                    out = value.translation.width
                }).onEnded(onEnd(value:))
                )
            .navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(true)
        }.animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu){newValue in
            if ((showMenu) && (offset == 0)){
                offset = sideBarWidth
            }
            if ((!showMenu) && (offset == sideBarWidth)){
                offset = 0
                lastStoredoffset = offset
                
            }
        }
        .onChange(of: gestureOffset){
            newValue in onChange()
        }
    }
    func onChange(){
        let sideBarWidth = getRect().width - 90
        offset = (gestureOffset != 0) ?(gestureOffset + lastStoredoffset < sideBarWidth ? gestureOffset + lastStoredoffset : offset): offset
    }
    func onEnd(value : DragGesture.Value){
        let sideBarWidth = getRect().width - 90
        let translation = value.translation.width
        withAnimation{
            
            if translation > 0 {
                if translation > (sideBarWidth/2){
                    offset = sideBarWidth
                    showMenu = true
                }else{
                    if offset == sideBarWidth{
                        return
                        
                    }
                    offset = 0
                    showMenu = false
                }
                
            }else{
                if -translation > (sideBarWidth / 2){
                    offset = 0
                    showMenu = false
                }else{
                    if offset == 0 || !showMenu{
                        return
                    }
                    offset = sideBarWidth
                    showMenu = true
                }
            }
            
        }
lastStoredoffset = offset
    }
}

struct baseView_Previews: PreviewProvider {
    static var previews: some View {
        baseView()
    }
}
