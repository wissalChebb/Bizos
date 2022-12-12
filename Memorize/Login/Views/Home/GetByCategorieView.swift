//
//  GetByCategorieView.swift
//  Memorize
//
//  Created by Apple Esprit on 12/12/2022.
//

import SwiftUI

struct GetByCategorieView: View {
    @ObservedObject  var userViewModel = UserViewModel()
    @State var categorie:String
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack{
                ForEach(0..<userViewModel.avocatsCat.count,id: \.self ) { item in
                  NavigationLink(
                    destination: ProfileView(avocat: userViewModel.avocatsCat[item]),
                    label: {
                        AvocatView(user: userViewModel.avocatsCat[item])
                        
                    })
                }.padding(.trailing)
                    
                
            }.onAppear{
                userViewModel.specialite = categorie
                userViewModel.getAllAvoatCat( complited: {(success , respnse)in
                    if success{
                        userViewModel.avocatsCat = respnse!
                        print("ahyaaaaa",  userViewModel.avocatsCat )
                    }else {
                        print("error cant connect ")
                    }
                    
                })
            }
        }
    }
}

struct GetByCategorieView_Previews: PreviewProvider {
    static var previews: some View {
        GetByCategorieView(categorie: "Civil Right")
    }
}
