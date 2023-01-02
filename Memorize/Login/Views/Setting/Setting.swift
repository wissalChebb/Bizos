//  SettingView.swift
//  Memorize
//
//  Created by Monaem Hmila on 13/12/2022.
//

import SwiftUI

struct SettingView: View {
    @State var showWeb = false
    @State var urlPrivacy = ""
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .center, spacing: 0)
            {
             
                
                Form{
                    
                    Section(header: Text("About The Application"))
                    {
                        FormRowStaticView(icon: "gear", FirstText: "Application", secondText: "Bizos")
                        
                        FormRowStaticView(icon: "checkmark.seal", FirstText: "Compatibility", secondText: "iPhone")
                        FormRowStaticView(icon: "keyboard", FirstText: "Developer", secondText: "Hassen/Wissal")
                        FormRowStaticView(icon: "flag", FirstText: "Verion", secondText: "1.0.0")
                        Button {
                            showWeb.toggle()
                        } label: {
                            FormRowStaticView(icon: "hand.raised", FirstText: "Privecy and conditions", secondText: "")
                        }.sheet(isPresented: $showWeb)
                        {
                            WebView(url: URL(string: urlPrivacy)!)
                        }

                        
                       
                    }.padding(.vertical,3)
                    
                }
                
                
                Text("Copyright © All rights reserved. ").multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top,6)
                    .padding(.bottom,8)
                    .foregroundColor(Color.secondary)
            }
            .navigationBarTitle("Setting",displayMode: .inline)
            .background(Color("Bg").ignoresSafeArea(.all))
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
