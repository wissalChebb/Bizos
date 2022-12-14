//
//  ChatsSwiftUIView.swift
//  Memorize
//
//  Created by Apple Esprit on 14/12/2022.
//

import SwiftUI

struct ChatsSwiftUIView: View {
    var body: some View {
        StoryboardViewController()
    }
}

struct ChatsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsSwiftUIView()
    }
}
struct StoryboardViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "chat", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "bcntroller")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
