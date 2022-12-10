//
//  ScannerView.swift
//  Memorize
//
//  Created by Apple Esprit on 10/12/2022.
//

import SwiftUI

struct ScannerView: View {
    @State private var showScannerSheet = false
    var body: some View {
        NavigationView{
            VStack{
                
            }.navigationTitle("scanner")
                .navigationBarItems(trailing: Button(action: {
                    self.showScannerSheet = true
                }, label: {
                    Image(systemName: "doc.text.viewfinder").font(.title)
                }).sheet(isPresented: $showScannerSheet, content: {
                    
                })
                )
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
