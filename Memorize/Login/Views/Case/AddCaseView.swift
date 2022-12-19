//
//  AddCaseView.swift
//  Memorize
//
//  Created by Apple Esprit on 29/11/2022.
//

import SwiftUI
import RiveRuntime
struct AddCaseView: View {
    
    @State var   titre:String = ""
    @State var   name:String = ""
    @State var   lastname:String = ""
    @State var   description:String = ""
    @ObservedObject var viewModel = CasesViewModel()
    
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
                                        Image(systemName: "person.fill").foregroundColor(Color.white)
                                    }
                                    .frame(width: 36,height: 36,alignment: .center)
                                    Text("User Name :").foregroundColor(Color.black)
                                    Spacer()
                                    Spacer()
                                    TextField("Enter user name...",text:$name)
                                }.padding(.horizontal,10)
                                HStack{
                                    ZStack{
                                        
                                        RoundedRectangle(cornerRadius: 8,style: .continuous).fill(Color.gray)
                                        Image(systemName: "shared.with.you").foregroundColor(Color.white)
                                    }
                                    .frame(width: 36,height: 36,alignment: .center)
                                    Text("Last Name User :").foregroundColor(Color.black)
                                    Spacer()
                                    Spacer()
                                    TextField("Enter user Last name...",text:$lastname)
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
                                viewModel.addCase(casee: Case(traite: false, description: description, title: titre, name: name, prenom: lastname))
                                r = true
                                
                                
                                
                                
                            })
                            .frame(width:100, height: 50).foregroundColor(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1))).background(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1))).cornerRadius(15).shadow(radius: 3)
                        }
                        Spacer()
                        
                        
                        
                        
                        
                    }.background(
                        RiveViewModel(fileName: "new_file").view()
                            
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .ignoresSafeArea()
                            .blur(radius: 30)
                    )
                    
                
            
        }
    }
    
    struct AddCaseView_Previews: PreviewProvider {
        static var previews: some View {
            AddCaseView()
        }
    }
    struct TextAreaView: View {
        
        @Binding var text :String
        let placeholder :String
        
        init (_ placeholder : String ,text :Binding<String>  ){
            self.placeholder = placeholder
            self._text = text
            UITextView.appearance().backgroundColor = .clear
            
        }
        
        
        var body: some View {
            
            ZStack(alignment: .topLeading){
                if text.isEmpty{
                    Text(placeholder)
                        .foregroundColor(Color(.placeholderText))
                        .padding(.horizontal, 8)
                        .padding(.vertical , 12 )
                }
                TextEditor(text: $text)
                    .padding(4)
            }
            .font(.body)
        }
    }
}
