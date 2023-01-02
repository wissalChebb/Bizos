//
//  HistoryView.swift
//  Memorize
//
//  Created by Apple Esprit on 1/1/2023.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject  var userViewModel = UserViewModel()
    var body: some View {
        VStack{
            HStack{
                TagLineViewHistory()
                Spacer()
            }
            Spacer()
            ZStack{
                ScrollView{
               
                    ForEach(0..<userViewModel.Payments.count , id: \.self ) { item in
                        PaymentItem(payment: userViewModel.Payments[item])
                    }.padding(.trailing)
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
               
            }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
                .onAppear{
                    
                    userViewModel.getPaymentByAvocat(id: (UserViewModel.currentUser?.id)!, complited: {(success , respnse)in
                        if success{
                            userViewModel.Payments = respnse!
                            print("ahyaaaaa",  userViewModel.Payments )
                        }else {
                            print("error cant connect ")
                        }
                        
                    })
                }
        }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
        
    }
    }

struct TagLineViewHistory: View {
    @State private var isAvocat = false
    var body: some View {
        
        HStack{
            Text("Chose your  ").font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color("Primary"))
            + Text("\nPayment ! ").font(.custom("PlayfairDisplay-Bold", size: 30))
                .foregroundColor(Color("Primary"))
            
        }.padding()
        
    }
}
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
struct PaymentItem:View{
    var payment: payment
    @State var showWeb = false
    var body: some View {
        ZStack{
            
            HStack{
                VStack(alignment: .leading){
                    Button {
                       
                            showWeb.toggle()
                        }
                     label: {
                        AsyncImage(url: URL(string: "http://172.17.1.61:5000/QRCode/"+(payment.image)),
                                   content:{ image in
                            image

                        },placeholder: { })
                    }.sheet(isPresented: $showWeb)
                    {
                        WebView(url: URL(string: payment.url)!)
                    }
                    
                }.padding()
                
                
            }.frame(width: 350,height: 200).cornerRadius(40)
        }
}
}
