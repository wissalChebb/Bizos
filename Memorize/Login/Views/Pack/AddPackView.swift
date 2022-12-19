//
//  AddPackView.swift
//  Memorize
//
//

//  Created by Apple Esprit on 29/11/2022.
//

import SwiftUI
import RiveRuntime
struct AddPackView: View {
    
    @State var   titre:String = ""
    @State var   name:String = ""
    @State var   prix:String = ""
    @State var   description:String = ""
    @ObservedObject var viewModel = PackViewModel()
    
    @State private var r = false
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 10){
                Spacer()
                
                
                Section(header: Text(""))
                {
                    HStack{
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8,style: .continuous).fill(Color.gray)
                            Image(systemName: "list.bullet.clipboard.fill").foregroundColor(Color.white)
                        }
                        .frame(width: 36,height: 36,alignment: .center)
                        Text("Title :").foregroundColor(Color.black)
                        Spacer()
                        Spacer()
                        TextField("Enter Title...",text:$titre)
                    }.padding(.horizontal,10)
                    HStack{
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8,style: .continuous).fill(Color.gray)
                            Image(systemName: "quote.opening").foregroundColor(Color.white)
                        }
                        .frame(width: 36,height: 36,alignment: .center)
                        Text("Name :").foregroundColor(Color.black)
                        Spacer()
                        Spacer()
                        TextField("Enter name...",text:$name)
                    }.padding(.horizontal,10)
                    HStack{
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8,style: .continuous).fill(Color.gray)
                            Image(systemName: "dollarsign").foregroundColor(Color.white)
                        }
                        .frame(width: 36,height: 36,alignment: .center)
                        Text("Prix :").foregroundColor(Color.black)
                        Spacer()
                        Spacer()
                        TextField("Enter Prix ...",text:$prix)
                    }.padding(.horizontal,10)
                    HStack{
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8,style: .continuous).fill(Color.gray)
                            Image(systemName: "paragraphsign").foregroundColor(Color.white)
                        }
                        .frame(width: 36,height: 36,alignment: .center)
                        Text("Description :").foregroundColor(Color.black)
                        Spacer()
                        
                        TextEditor(text:$description)
                            .frame(width: 190,height: 100).opacity(description.isEmpty ? 0.25 : 0.75)
                        
                    }.padding(.horizontal,10)
                    
                }.padding(.horizontal,10)
                
                
                
                
                
                
                Spacer()
                
                NavigationLink(destination: CaseView(), isActive: $r ){
                    Button("Add", action: {
                        viewModel.addPack(pack: Pack(title: titre, name: name, prix: Float(prix)!, description: description, idUser: (UserViewModel.currentUser?.id)!))
                        r = true
                        
                        
                        
                        
                    })
                    .frame(width:100, height: 50).foregroundColor(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1))).background(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1))).cornerRadius(15).shadow(radius: 3)
                }
                Spacer()
                
                
                
                
                
            }.background(
                RiveViewModel(fileName: "new_file").view()
                
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .blur(radius: 20)
            )
            
            
            
        }
    }
    
    struct AddPackView_Previews: PreviewProvider {
        static var previews: some View {
            AddPackView()
        }
    }
    
}
