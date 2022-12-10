//
//  ScannerView.swift
//  Memorize
//
//  Created by Apple Esprit on 10/12/2022.
//

import SwiftUI

struct ScannerView: View {
    @State private var showScannerSheet = false
    @State private var texts : [ScanData] = []
    var body: some View {
        NavigationView{
            VStack{
                if texts.count > 0{
                    List{
                        ForEach(texts) { text in
                            NavigationLink(destination: ScrollView{Text(text.content)}, label: {
                                Text(text.content).lineLimit(1)
                            })
                        }
                    }
                }else{
                    Text("no scan yet") .font(.title)               }
                
            }.navigationTitle("scanner")
                .navigationBarItems(trailing: Button(action: {
                    self.showScannerSheet = true
                }, label: {
                    Image(systemName: "doc.text.viewfinder").font(.title)
                }).sheet(isPresented: $showScannerSheet, content: {
                    makeScannerView()
                    
                })
                )
        }
    }
    private func makeScannerView()->ScanKit{
        ScanKit(completion: {
            textPerpage in
            if let outputText = textPerpage?.joined(separator: "\n*").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
