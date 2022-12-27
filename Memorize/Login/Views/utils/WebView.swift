//
//  WebView.swift
//  Memorize
//
//  Created by Apple Esprit on 27/12/2022.
//

import SwiftUI
import WebKit
struct WebView: UIViewRepresentable {
    var url : URL
    func makeUIView(context : Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context){
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
   
}

