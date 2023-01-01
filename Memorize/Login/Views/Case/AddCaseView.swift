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
            ZStack{
                
                VStack(alignment: .leading ,spacing: 40){
                    VStack{
                        HStack{
                            Text("Title :")
                                .font(.callout)
                                .bold()
                                .padding()
                            TextField("Enter Title...",text:$titre)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                            
                        }
                        HStack{
                            Text("Name User ")
                                .font(.callout)
                                .bold()
                                .padding()
                            TextField("Enter user name...",text:$name)
                                
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                            
                        }
                        HStack{
                            Text("Last Name User :")
                                .font(.callout)
                                .bold()
                                .padding()
                            TextField("Enter user Last name...",text:$lastname)
                                .frame(width: 200)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                            
                        }
                      
                        HStack{
                            Text("Description")
                                .font(.callout)
                                .bold()
                                .padding()
                            
                            
                            
                            TextEditor(text:$description).frame(width: 200,height: 75)
                        }
                        
                        NavigationLink(destination: CaseView(), isActive: $r ){
                            Button("Register", action: {
                                viewModel.addCase(casee: Case(traite: false, description: description, title: titre, name: name, prenom: lastname))
                                r = true
                                
                                
                                
                                
                            })
                            .foregroundColor(.black)
                            .frame(width: 100, height: 40)
                            .border(.black,width: 2.0)
                            .padding(20)
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    
                }
            }.padding(40)
                .padding(.top, 40)
                .background(
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
